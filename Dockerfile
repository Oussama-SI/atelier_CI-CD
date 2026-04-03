# Stage 1: build Angular app from ./project
FROM node:20-alpine AS builder

WORKDIR /app/project

COPY project/package*.json ./
RUN npm config set registry https://registry.npmjs.org/ \
 && npm ci --no-audit --fund=false \
 && if npm ls --all --depth=9999 2>/dev/null | grep -Eiq '(^|[[:space:]])(axios|axois|aixos|axi0s)@'; then \
			echo 'Blocked: axios or axios-like package detected in dependency tree.'; \
			npm ls --all --depth=9999 | grep -Ei '(axios|axois|aixos|axi0s)@' || true; \
			exit 1; \
		fi

COPY project/. ./

# Build output path is configured in project/angular.json as dist/demo
RUN npm run build -- --configuration production

# Stage 2: serve static files with nginx
FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/project/dist/demo/browser /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
