import { db } from '@/libs/drizzle/db';
import { ordersSchema } from '@/libs/drizzle/schemas';
import { getRandomObjectId } from './utils/get-random';

// Types
type Order = typeof ordersSchema.$inferInsert;

export const seedOrders = async () => {
  // Query seller ids
  const sellerIds = await db.query.sellersSchema.findMany({
    columns: { id: true },
  });
  if (!sellerIds.length) throw new Error(`Seller ids not found`);

  // Query client ids
  const clientIds = await db.query.clientsSchema.findMany({
    columns: { id: true },
  });
  if (!clientIds.length) throw new Error(`Client ids not found`);

  // Prepare mocked data
  const mockedOrders = [].map(
    (): Order => ({
      sellerId: getRandomObjectId(sellerIds),
      clientId: getRandomObjectId(clientIds),
    }),
  );

  // Insert seeds
  const result = await db.insert(ordersSchema).values(mockedOrders);
  console.log('Seeding completed for: orders');
  return result;
};
