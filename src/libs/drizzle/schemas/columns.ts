import { integer, timestamp } from 'drizzle-orm/pg-core';

export const id = integer().primaryKey().generatedAlwaysAsIdentity();
export const createdAt = timestamp('created_at').notNull().defaultNow();

export const updatedAt = timestamp('updated_at')
  .notNull()
  .defaultNow()
  .$onUpdate(() => new Date());
