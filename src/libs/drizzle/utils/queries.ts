import { db } from '@/libs/drizzle/db';
import { userRolesSchema } from '@/libs/drizzle/schemas';
import { eq } from 'drizzle-orm';

export const findUserRoleIdByName = async (name: string) => {
  const userRoleId = await db.query.userRolesSchema.findFirst({
    columns: { id: true },
    where: eq(userRolesSchema.name, name),
  });

  if (!userRoleId) throw new Error('User role not found');
  return userRoleId.id;
};
