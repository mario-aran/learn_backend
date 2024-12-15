import { relations } from 'drizzle-orm';
import { integer, pgTable, timestamp, varchar } from 'drizzle-orm/pg-core';
import { salesSchema } from './sales.schema';

export const clientsSchema = pgTable('clients', {
  createdAt: timestamp('created_at').notNull().defaultNow(),
  updatedAt: timestamp('updated_at')
    .notNull()
    .defaultNow()
    .$onUpdate(() => new Date()),
  id: integer().primaryKey().generatedAlwaysAsIdentity(),
  name: varchar('name').notNull(),
});

export const clientsRelations = relations(clientsSchema, ({ many }) => ({
  sales: many(salesSchema),
}));
