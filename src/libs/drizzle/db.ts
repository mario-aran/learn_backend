import { DATABASE_URL } from '@/config/env';
import { drizzle } from 'drizzle-orm/node-postgres';
import * as schemas from './schemas';

export const db = drizzle(DATABASE_URL, {
  schema: schemas, // Add schemas to db.query
  logger: true, // Logs
});
