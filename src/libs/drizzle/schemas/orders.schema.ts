import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { relations } from 'drizzle-orm';
import { pgTable, uuid } from 'drizzle-orm/pg-core';
import { clientsSchema } from './clients.schema';
import { ordersToProductsSchema } from './orders-to-products.schema';
import { sellersSchema } from './sellers.schema';

export const ordersSchema = pgTable('orders', {
  id: uuid().primaryKey().defaultRandom(),
  sellerId: uuid('seller_id')
    .notNull()
    .references(() => sellersSchema.id),
  clientId: uuid('client_id')
    .notNull()
    .references(() => clientsSchema.id),
  ...BASE_DATE_COLUMNS,
});

export const ordersRelations = relations(ordersSchema, ({ many, one }) => ({
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
