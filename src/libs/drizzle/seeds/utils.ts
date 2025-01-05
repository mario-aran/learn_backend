import { db } from '@/libs/drizzle/db';
import {
  userRolesSchema,
  usersToUserRolesSchema,
} from '@/libs/drizzle/schemas';
import { eq } from 'drizzle-orm';

export const findUsersByRoleName = async (roleName: string) => {
  // Queries
  const userRole = await db.query.userRolesSchema.findFirst({
    columns: { id: true },
    where: eq(userRolesSchema.name, roleName),
  });
  if (!userRole) throw new Error(`No ${roleName} user role found`);

  const roleUsers = await db.query.usersSchema.findMany({
    columns: { id: true },
    with: {
      usersToUserRoles: {
        columns: { userId: true },
        where: eq(usersToUserRolesSchema.userRoleId, userRole.id),
      },
    },
  });
  if (roleUsers.length === 0) throw new Error(`No ${roleName} users found`);

  return roleUsers.map(({ id }) => ({ id }));
};
