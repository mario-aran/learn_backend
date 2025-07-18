import { relations } from 'drizzle-orm';
import { pgTable, uuid } from 'drizzle-orm/pg-core';
import { clientsSchema } from './clients.schema';
import { createdAt, id, updatedAt } from './columns';
import { ordersToProductsSchema } from './orders-to-products.schema';
import { sellersSchema } from './sellers.schema';

// Constats
export const TABLE_ORDERS = 'orders';

export const ordersSchema = pgTable(TABLE_ORDERS, {
  id,
  sellerId: uuid('seller_id')
    .notNull()
    .references(() => sellersSchema.id),
  clientId: uuid('client_id')
    .notNull()
    .references(() => clientsSchema.id),
  createdAt,
  updatedAt,
});

export const ordersRelations = relations(ordersSchema, ({ one, many }) => ({
  ordersToProducts: many(ordersToProductsSchema),
  seller: one(sellersSchema, {
    fields: [ordersSchema.sellerId],
    references: [sellersSchema.id],
  }),
  client: one(clientsSchema, {
    fields: [ordersSchema.clientId],
    references: [clientsSchema.id],
  }),
}));
