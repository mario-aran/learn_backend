import { relations } from 'drizzle-orm';
import { pgTable, uuid } from 'drizzle-orm/pg-core';
import { clientDiscountsSchema } from './client-discounts.schema';
import { baseDateColumns } from './columns';
import { ordersSchema } from './orders.schema';
import { usersSchema } from './users.schema';

// Constants
export const TABLE_CLIENTS = 'clients';

export const clientsSchema = pgTable(TABLE_CLIENTS, {
  id: uuid().primaryKey().defaultRandom(),
  clientDiscountId: uuid('client_discount_id')
    .notNull()
    .references(() => clientDiscountsSchema.id),
  userId: uuid('user_id')
    .notNull()
    .unique()
    .references(() => usersSchema.id),
  ...baseDateColumns,
});

export const clientsRelations = relations(clientsSchema, ({ one, many }) => ({
  orders: many(ordersSchema),
  clientDiscount: one(clientDiscountsSchema, {
    fields: [clientsSchema.clientDiscountId],
    references: [clientDiscountsSchema.id],
  }),
  user: one(usersSchema, {
    fields: [clientsSchema.userId],
    references: [usersSchema.id],
  }),
}));
