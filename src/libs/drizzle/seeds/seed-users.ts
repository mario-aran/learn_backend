import { SEEDS_LENGTH } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { TABLE_USERS, usersSchema } from '@/libs/drizzle/schemas';
import { faker } from '@faker-js/faker';

// Types
type User = typeof usersSchema.$inferInsert;

export const seedUsers = async () => {
  // Queries
  const userRoles = await db.query.userRolesSchema.findMany({
    columns: { id: true },
  });
  if (userRoles.length === 0) throw new Error('No user roles found');

  // Prepare mocks
  const mockedUsers = faker.helpers
    .uniqueArray(faker.internet.email, SEEDS_LENGTH)
    .map(
      (email): User => ({
        name: faker.person.fullName(),
        email,
        password: faker.internet.password(),
        userRoleId: faker.helpers.arrayElement(userRoles).id,
      }),
    );

  // Insert seeds
  await db.insert(usersSchema).values(mockedUsers);

  console.log(`Seeding completed for: ${TABLE_USERS}`);
};
