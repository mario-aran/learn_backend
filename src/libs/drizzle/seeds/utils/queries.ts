import { db } from '@/libs/drizzle/db';
import { userRolesSchema } from '@/libs/drizzle/schemas';
import { eq } from 'drizzle-orm';

export const findUserIdsByRoleName = async (roleName: string) => {
  const userIds = await db.query.usersSchema.findMany({
    columns: { id: true },
    where: eq(userRolesSchema.name, roleName),
  });

  if (!userIds) throw new Error(`${roleName} user ids not found`);
  return userIds.map(({ id }) => ({ userId: id }));
};
