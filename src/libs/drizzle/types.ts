import { db } from './db';

// Drizzle transaction parameter tx type
export type TX = Parameters<Parameters<typeof db.transaction>[0]>[0];
