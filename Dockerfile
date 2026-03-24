# Stage 1: build Angular app from ./project
FROM node:20-alpine AS builder

WORKDIR /app/project

COPY project/package*.json ./
RUN npm ci

COPY project/. ./

# Build output path is configured in project/angular.json as dist/demo
RUN npm run build -- --configuration production

# Stage 2: serve static files with nginx
FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/project/dist/demo/browser /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
