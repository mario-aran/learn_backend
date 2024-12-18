import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { pgTable, uuid } from 'drizzle-orm/pg-core';
import { clientDiscountsSchema } from './client-discounts.schema';
import { usersSchema } from './users.schema';

export const clientsSchema = pgTable('clients', {
  id: uuid().primaryKey().defaultRandom(),
  userId: uuid('user_id')
    .notNull()
    .unique()
    .references(() => usersSchema.id),
  clientDiscountId: uuid('client_discount_id')
    .notNull()
    .references(() => clientDiscountsSchema.id),
  ...BASE_DATE_COLUMNS,
});

// export const clientsRelations = relations(clientsSchema, ({ many }) => ({
//   sales: many(ordersSchema),
// }));
