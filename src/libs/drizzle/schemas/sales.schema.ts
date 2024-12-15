import { relations } from 'drizzle-orm';
import { pgTable, timestamp, uuid } from 'drizzle-orm/pg-core';
import { clientsSchema } from './clients.schema';
import { products } from './products.schema';

export const salesSchema = pgTable('sales', {
  createdAt: timestamp('created_at').notNull().defaultNow(),
  updatedAt: timestamp('updated_at')
    .notNull()
    .defaultNow()
    .$onUpdate(() => new Date()),
  id: uuid('id').primaryKey().defaultRandom(),
  clientId: uuid('client_id')
    .notNull()
    .references(() => clientsSchema.id),
  productId: uuid('product_id')
    .notNull()
    .references(() => products.id),
});

export const salesRelations = relations(salesSchema, ({ one }) => ({
  client: one(clientsSchema, {
    fields: [salesSchema.clientId],
    references: [clientsSchema.id],
  }),
  product: one(products, {
    fields: [salesSchema.productId],
    references: [products.id],
  }),
}));
