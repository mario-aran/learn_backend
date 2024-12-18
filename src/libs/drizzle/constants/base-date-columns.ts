import { timestamp } from 'drizzle-orm/pg-core';

export const BASE_DATE_COLUMNS = {
  createdAt: timestamp('created_at').notNull().defaultNow(),
  updatedAt: timestamp('updated_at')
    .notNull()
    .defaultNow()
    .$onUpdate(() => new Date()),
};
