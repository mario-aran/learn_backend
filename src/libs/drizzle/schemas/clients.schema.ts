import { relations } from 'drizzle-orm';
import { pgTable, timestamp, uuid, varchar } from 'drizzle-orm/pg-core';
import { clientsToSales } from './clients-to-sales.schema';

export const clients = pgTable('clients', {
  createdAt: timestamp('created_at').notNull().defaultNow(),
  updatedAt: timestamp('updated_at')
    .notNull()
    .defaultNow()
    .$onUpdate(() => new Date()),
  id: uuid('id').primaryKey().defaultRandom(),
  name: varchar('name').notNull(),
});

export const clientsRelations = relations(clients, ({ many }) => ({
  clientsToSales: many(clientsToSales),
}));
