import { relations } from 'drizzle-orm';
import { integer, pgTable } from 'drizzle-orm/pg-core';
import { BASE_COLUMNS } from '../constants';
import { clientsSchema } from './clients.schema';
import { productsSchema } from './products.schema';

// Constants
const TABLE_NAME = 'orders';

export const ordersSchema = pgTable(TABLE_NAME, {
  ...BASE_COLUMNS,
  clientId: integer('client_id')
    .notNull()
    .references(() => clientsSchema.id),
  productId: integer('product_id')
    .notNull()
    .references(() => productsSchema.id),
});

export const salesRelations = relations(ordersSchema, ({ one }) => ({
  client: one(clientsSchema, {
    fields: [ordersSchema.clientId],
    references: [clientsSchema.id],
  }),
  product: one(productsSchema, {
    fields: [ordersSchema.productId],
    references: [productsSchema.id],
  }),
}));
