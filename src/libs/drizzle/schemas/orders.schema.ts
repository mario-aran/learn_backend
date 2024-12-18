import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { pgTable, uuid } from 'drizzle-orm/pg-core';
import { clientsSchema } from './clients.schema';
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

// export const salesRelations = relations(ordersSchema, ({ one }) => ({
//   client: one(clientsSchema, {
//     fields: [ordersSchema.clientId],
//     references: [clientsSchema.id],
//   }),
//   product: one(productsSchema, {
//     fields: [ordersSchema.productId],
//     references: [productsSchema.id],
//   }),
// }));
