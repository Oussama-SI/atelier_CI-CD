declare module '@supabase/phoenix/priv/static/types/timer' {
  export default class Timer {
    constructor(callback: Function, timerCalc: Function);
    reset(): void;
    scheduleTimeout(): void;
  }
}

declare module '@supabase/phoenix/priv/static/types/types' {
  export type Vsn = string;
}