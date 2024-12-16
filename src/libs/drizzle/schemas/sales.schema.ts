import { relations } from 'drizzle-orm';
import { integer, pgTable, timestamp } from 'drizzle-orm/pg-core';
import { clientsSchema } from './clients.schema';
import { productsSchema } from './products.schema';

export const salesSchema = pgTable('sales', {
  createdAt: timestamp('created_at').notNull().defaultNow(),
  updatedAt: timestamp('updated_at')
    .notNull()
    .defaultNow()
    .$onUpdate(() => new Date()),
  id: integer().primaryKey().generatedAlwaysAsIdentity(),
  clientId: integer('client_id')
    .notNull()
    .references(() => clientsSchema.id),
  productId: integer('product_id')
    .notNull()
    .references(() => productsSchema.id),
});

export const salesRelations = relations(salesSchema, ({ one }) => ({
  client: one(clientsSchema, {
    fields: [salesSchema.clientId],
    references: [clientsSchema.id],
  }),
  product: one(productsSchema, {
    fields: [salesSchema.productId],
    references: [productsSchema.id],
  }),
}));
