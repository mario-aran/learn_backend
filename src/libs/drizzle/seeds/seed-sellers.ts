import { USER_ROLES } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { sellersSchema } from '@/libs/drizzle/schemas';
import { Seller } from '@/libs/drizzle/types';
import { findUserIdsByRoleName } from './utils/queries';

export const seedSellers = async () => {
  // Query seller user ids
  const sellerUserIds = await findUserIdsByRoleName(USER_ROLES.SELLER);

  // Prepare mocked data
  const mockedSellers = sellerUserIds.map(
    ({ id }): Seller => ({
      userId: id,
    }),
  );

  // Insert seeds
  const result = await db.insert(sellersSchema).values(mockedSellers);
  console.log('Seeding completed for: sellers');
  return result;
};
