import { USER_ROLES } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { clientsSchema, TABLE_CLIENTS } from '@/libs/drizzle/schemas';
import { TX } from '@/libs/drizzle/types';
import { faker } from '@faker-js/faker';
import { findUsersByRoleName } from './utils';

// Types
type Client = typeof clientsSchema.$inferInsert;

export const seedClients = async (tx: TX) => {
  // Queries
  const clientUsers = await findUsersByRoleName(USER_ROLES.CLIENT);

  const clientDiscounts = await db.query.clientDiscountsSchema.findMany({
    columns: { id: true },
  });
  if (clientDiscounts.length === 0)
    throw new Error('No client discounts found');

  // Prepare mocks
  const mockedClients = clientUsers.map(
    ({ id }): Client => ({
      clientDiscountId: faker.helpers.arrayElement(clientDiscounts).id,
      userId: id,
    }),
  );

  // Run insert transaction
  await tx.insert(clientsSchema).values(mockedClients);

  console.log(`Seeding completed for: ${TABLE_CLIENTS}`);
};
