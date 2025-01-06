import { db } from '@/libs/drizzle/db';
import { userRolesSchema, usersSchema } from '@/libs/drizzle/schemas';
import { eq } from 'drizzle-orm';

export const findUsersByRoleName = async (roleName: string) => {
  // Queries
  const userRole = await db.query.userRolesSchema.findFirst({
    columns: { id: true },
    where: eq(userRolesSchema.name, roleName),
  });
  if (!userRole) throw new Error(`No ${roleName} user role found`);

  const users = await db.query.usersSchema.findMany({
    columns: { id: true },
    where: eq(usersSchema.userRoleId, userRole.id),
  });
  if (users.length === 0) throw new Error(`No ${roleName} users found`);

  return users;
};
