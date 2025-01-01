import { USER_ROLES } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { clientsSchema } from '@/libs/drizzle/schemas';
import { Client } from '@/libs/drizzle/types';
import { getRandomObjectId } from './utils/get-random';
import { findUserIdsByRoleName } from './utils/queries';

export const seedClients = async () => {
  // Query client user ids
  const clientUserIds = await findUserIdsByRoleName(USER_ROLES.CLIENT);

  // Query client discount ids
  const clientDiscountIds = await db.query.clientDiscountsSchema.findMany({
    columns: { id: true },
  });
  if (!clientDiscountIds.length)
    throw new Error('No client discount ids found');

  // Prepare mocked data
  const mockedClients = clientUserIds.map(
    ({ id }): Client => ({
      userId: id,
      clientDiscountId: getRandomObjectId(clientDiscountIds),
    }),
  );

  // Insert seeds
  const result = await db.insert(clientsSchema).values(mockedClients);
  console.log('Seeding completed for: clients');
  return result;
};
