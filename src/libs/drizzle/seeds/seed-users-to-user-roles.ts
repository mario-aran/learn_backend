import { SEEDS_LENGTH } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { usersToUserRolesSchema } from '@/libs/drizzle/schemas';
import { sql } from 'drizzle-orm';

// Utils
const getRandomIdFromArr = (arr: { id: string }[]) =>
  arr[Math.floor(Math.random() * arr.length)].id;

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

  // Prepare mock data
  const mockData = userIds.map(({ id }) => ({
    userId: id,
    userRoleId: getRandomIdFromArr(userRoleIds),
  }));

  // Insert values into the database
  const result = await db.insert(usersToUserRolesSchema).values(mockData);
  console.log('Seeding completed for: usersToUserRoles');
  return result;
};
