import { db } from '@/libs/drizzle/db';
import { clientsSchema } from '@/libs/drizzle/schemas';
import { faker } from '@faker-js/faker';
import { USER_ROLES } from './constants';
import { findUsersByRoleName } from './utils';

// Types
type Client = typeof clientsSchema.$inferInsert;

export const seedClients = async () => {
  // Queries
  const clientUsers = await findUsersByRoleName(USER_ROLES.CLIENT);

  const clientDiscounts = await db.query.clientDiscountsSchema.findMany({
    columns: { id: true },
  });
  if (clientDiscounts.length === 0)
    throw new Error('No client discounts found');

  // Mocked data
  const mockedClients = clientUsers.map(
    ({ id }): Client => ({
      clientDiscountId: faker.helpers.arrayElement(clientDiscounts).id,
      userId: id,
    }),
  );

  // Insert seeds
  const result = await db.insert(clientsSchema).values(mockedClients);
  console.log('Seeding completed for: clients');
  return result;
};
