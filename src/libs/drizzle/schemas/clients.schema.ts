import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { integer, pgTable, uuid, varchar } from 'drizzle-orm/pg-core';
import { clientDiscountsSchema } from './client-discounts.schema';
import { usersSchema } from './users.schema';

// Constants
const TABLE_NAME = 'clients';

export const clientsSchema = pgTable(TABLE_NAME, {
  ...BASE_DATE_COLUMNS,
  id: uuid().primaryKey().defaultRandom(),
  name: varchar('name').notNull(),
  userId: integer('client_id')
    .notNull()
    .references(() => usersSchema.id),
  clientDiscountId: integer('product_id')
    .notNull()
    .references(() => clientDiscountsSchema.id),
});

// export const clientsRelations = relations(clientsSchema, ({ many }) => ({
//   sales: many(ordersSchema),
// }));
