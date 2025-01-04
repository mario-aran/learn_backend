import { db } from '@/libs/drizzle/db';
import {
  TABLE_USERS_TO_USER_ROLES,
  usersToUserRolesSchema,
} from '@/libs/drizzle/schemas';
import { TX } from '@/libs/drizzle/types';
import { faker } from '@faker-js/faker';

// Types
type UserToUserRole = typeof usersToUserRolesSchema.$inferInsert;

export const seedUsersToUserRoles = async (tx: TX) => {
  // Queries
  const users = await db.query.usersSchema.findMany({
    columns: { id: true },
  });
  if (users.length === 0) throw new Error('No users found');

  const userRoles = await db.query.userRolesSchema.findMany({
    columns: { id: true },
  });
  if (userRoles.length === 0) throw new Error('No user roles found');

  // Prepare mocks
  const mockedUsersToUserRoles = users.map(
    ({ id }): UserToUserRole => ({
      userId: id,
      userRoleId: faker.helpers.arrayElement(userRoles).id,
    }),
  );

  // Run insert transaction
  await tx.insert(usersToUserRolesSchema).values(mockedUsersToUserRoles);

  console.log(`Seeding completed for: ${TABLE_USERS_TO_USER_ROLES}`);
};
