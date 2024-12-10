import { relations } from 'drizzle-orm';
import { pgTable, timestamp, uuid } from 'drizzle-orm/pg-core';
import { clientsToSales } from './clients-to-sales.schema';
import { productsToSales } from './products-to-sales.schema';

export const sales = pgTable('sales', {
  createdAt: timestamp('created_at').notNull().defaultNow(),
  updatedAt: timestamp('updated_at')
    .notNull()
    .defaultNow()
    .$onUpdate(() => new Date()),
  id: uuid('id').primaryKey().defaultRandom(),
});

export const salesRelations = relations(sales, ({ many }) => ({
  clientsToSales: many(clientsToSales),
  productsToSales: many(productsToSales),
}));
