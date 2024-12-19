import { BASE_DATE_COLUMNS } from '@/libs/drizzle/constants';
import { pgTable, primaryKey, uuid } from 'drizzle-orm/pg-core';
import { ordersSchema } from './orders.schema';
import { productsSchema } from './products.schema';

export const usersToUserRolesSchema = pgTable(
  'users_to_user_roles',
  {
    userId: uuid('user_id')
      .notNull()
      .references(() => ordersSchema.id),
    userRoleId: uuid('user_role_id')
      .notNull()
      .references(() => productsSchema.id),
    ...BASE_DATE_COLUMNS,
  },
  (t) => [primaryKey({ columns: [t.userId, t.userRoleId] })],
);
