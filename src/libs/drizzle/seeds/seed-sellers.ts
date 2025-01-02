import { db } from '@/libs/drizzle/db';
import { sellersSchema } from '@/libs/drizzle/schemas';
import { USER_ROLES } from './constants';
import { findUsersByRoleName } from './utils';

// Types
type Seller = typeof sellersSchema.$inferInsert;

export const seedSellers = async () => {
  // Queries
  const sellerUsers = await findUsersByRoleName(USER_ROLES.SELLER);

  // Mocked data
  const mockedSellers = sellerUsers.map(
    ({ id }): Seller => ({
      userId: id,
    }),
  );

  // Insert seeds
  const result = await db.insert(sellersSchema).values(mockedSellers);
  console.log('Seeding completed for: sellers');
  return result;
};
