import { USER_ROLES } from '@/libs/drizzle/constants';
import { sellersSchema, TABLE_SELLERS } from '@/libs/drizzle/schemas';
import { TX } from '@/libs/drizzle/types';
import { findUsersByRoleName } from './utils';

// Types
type Seller = typeof sellersSchema.$inferInsert;

export const seedSellers = async (tx: TX) => {
  // Queries
  const sellerUsers = await findUsersByRoleName(USER_ROLES.SELLER);

  // Prepare mocks
  const mockedSellers = sellerUsers.map(
    ({ id }): Seller => ({
      userId: id,
    }),
  );

  // Run insert transaction
  await tx.insert(sellersSchema).values(mockedSellers);

  console.log(`Seeding completed for: ${TABLE_SELLERS}`);
};
