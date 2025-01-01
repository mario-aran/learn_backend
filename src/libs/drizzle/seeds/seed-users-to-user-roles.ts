import { db } from '@/libs/drizzle/db';
import { usersToUserRolesSchema } from '@/libs/drizzle/schemas';
import { getRandomObjectId } from './utils/get-random';

// Types
type UserToUserRole = typeof usersToUserRolesSchema.$inferInsert;

export const seedUsersToUserRoles = async () => {
  // Query user ids
  const userIds = await db.query.usersSchema.findMany({
    columns: { id: true },
  });
  if (!userIds.length) throw new Error('No user ids found');

  // Query user role ids
  const userRoleIds = await db.query.userRolesSchema.findMany({
    columns: { id: true },
  });
  if (!userRoleIds.length) throw new Error('No user role ids found');

  // Prepare mocked data
  const mockedUsersToUserRoles = userIds.map(
    ({ id }): UserToUserRole => ({
      userId: id,
      userRoleId: getRandomObjectId(userRoleIds),
    }),
  );

  // Insert seeds
  const result = await db
    .insert(usersToUserRolesSchema)
    .values(mockedUsersToUserRoles);
  console.log('Seeding completed for: usersToUserRoles');
  return result;
};
