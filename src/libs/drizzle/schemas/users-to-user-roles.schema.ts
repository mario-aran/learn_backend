import { relations } from 'drizzle-orm';
import { pgTable, primaryKey, uuid } from 'drizzle-orm/pg-core';
import { baseDateColumns } from './columns';
import { userRolesSchema } from './user-roles.schema';
import { usersSchema } from './users.schema';

// Constants
export const TABLE_USERS_TO_USER_ROLES = 'users_to_user_roles';

export const usersToUserRolesSchema = pgTable(
  TABLE_USERS_TO_USER_ROLES,
  {
    userId: uuid('user_id')
      .notNull()
      .references(() => usersSchema.id),
    userRoleId: uuid('user_role_id')
      .notNull()
      .references(() => userRolesSchema.id),
    ...baseDateColumns,
  },
  (t) => [primaryKey({ columns: [t.userId, t.userRoleId] })],
);

export const usersToUserRolesRelations = relations(
  usersToUserRolesSchema,
  ({ one }) => ({
    user: one(usersSchema, {
      fields: [usersToUserRolesSchema.userId],
      references: [usersSchema.id],
    }),
    userRole: one(userRolesSchema, {
      fields: [usersToUserRolesSchema.userRoleId],
      references: [userRolesSchema.id],
    }),
  }),
);
