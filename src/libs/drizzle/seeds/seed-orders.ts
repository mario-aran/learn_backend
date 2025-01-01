import { db } from '@/libs/drizzle/db';
import { ordersSchema } from '@/libs/drizzle/schemas';
import { faker } from '@faker-js/faker/.';
import { SEEDS_LENGTH } from './constants';

// Types
type Order = typeof ordersSchema.$inferInsert;

export const seedOrders = async () => {
  // Queries
  const sellers = await db.query.sellersSchema.findMany({
    columns: { id: true },
  });
  if (sellers.length === 0) throw new Error('No sellers found');

  const clients = await db.query.clientsSchema.findMany({
    columns: { id: true },
  });
  if (clients.length === 0) throw new Error('No clients found');

  // Mocked data
  const mockedOrders = Array.from(
    { length: SEEDS_LENGTH },
    (): Order => ({
      sellerId: faker.helpers.arrayElement(sellers).id,
      clientId: faker.helpers.arrayElement(clients).id,
    }),
  );

  // Insert seeds
  const result = await db.insert(ordersSchema).values(mockedOrders);
  console.log('Seeding completed for: orders');
  return result;
};
