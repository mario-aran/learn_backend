import { SEEDS_LENGTH } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { usersToUserRolesSchema } from '@/libs/drizzle/schemas';
import { sql } from 'drizzle-orm';

export const seedUsersToUserRoles = async () => {
  // Fetch limited random userIds
  const userIds = await db.query.usersSchema.findMany({
    columns: { id: true },
    orderBy: sql`RANDOM()`,
    limit: SEEDS_LENGTH,
  });
  if (!userIds.length) throw new Error('No userIds found');

  // Fetch all userRoleIds
  const userRoleIds = await db.query.userRolesSchema.findMany({
    columns: { id: true },
  });
  if (!userRoleIds.length) throw new Error('No userRoleIds found');

  // Utility to get a random userRoleId
  const getRandomUserRoleId = () =>
    userRoleIds[Math.floor(Math.random() * userRoleIds.length)].id;

  // Prepare values
  const values = userIds.map(({ id }) => ({
    userId: id,
    userRoleId: getRandomUserRoleId(),
  }));

  // Insert values into the database
  const result = await db.insert(usersToUserRolesSchema).values(values);
  console.log('Successfully seeded usersToUserRolesSchema');
  return result;
};
