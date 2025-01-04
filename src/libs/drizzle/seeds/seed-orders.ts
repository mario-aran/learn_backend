import { SEEDS_LENGTH } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { ordersSchema, TABLE_ORDERS } from '@/libs/drizzle/schemas';
import { TX } from '@/libs/drizzle/types';
import { faker } from '@faker-js/faker';

// Types
type Order = typeof ordersSchema.$inferInsert;

export const seedOrders = async (tx: TX) => {
  // Queries
  const sellers = await db.query.sellersSchema.findMany({
    columns: { id: true },
  });
  if (sellers.length === 0) throw new Error('No sellers found');

  const clients = await db.query.clientsSchema.findMany({
    columns: { id: true },
  });
  if (clients.length === 0) throw new Error('No clients found');

  // Prepare mocks
  const mockedOrders = Array.from(
    { length: SEEDS_LENGTH },
    (): Order => ({
      sellerId: faker.helpers.arrayElement(sellers).id,
      clientId: faker.helpers.arrayElement(clients).id,
    }),
  );

  // Run insert transaction
  await tx.insert(ordersSchema).values(mockedOrders);

  console.log(`Seeding completed for: ${TABLE_ORDERS}`);
};
