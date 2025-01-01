import { db } from '@/libs/drizzle/db';
import { clientsSchema, userRolesSchema } from '@/libs/drizzle/schemas';
import { faker } from '@faker-js/faker/.';
import { eq } from 'drizzle-orm';
import { USER_ROLES } from './constants';

// Types
type Client = typeof clientsSchema.$inferInsert;

export const seedClients = async () => {
  // Queries
  const clientUsers = await db.query.usersSchema.findMany({
    columns: { id: true },
    where: eq(userRolesSchema.name, USER_ROLES.CLIENT),
  });
  if (clientUsers.length === 0) throw new Error('No client users found');

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
