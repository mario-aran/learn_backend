import { DATABASE_URL } from '@/config/env';
import { drizzle } from 'drizzle-orm/node-postgres';
import * as schemas from './schemas';

export const db = drizzle(DATABASE_URL, {
  schema: schemas, // All schemas to use drizzle query
  logger: true, // Logs
});
