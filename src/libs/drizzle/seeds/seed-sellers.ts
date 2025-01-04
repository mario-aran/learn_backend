import { USER_ROLES } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { sellersSchema, TABLE_SELLERS } from '@/libs/drizzle/schemas';
import { findUsersByRoleName } from './utils';

// Types
type Seller = typeof sellersSchema.$inferInsert;

export const seedSellers = async () => {
  // Queries
  const sellerUsers = await findUsersByRoleName(USER_ROLES.SELLER);

  // Prepare mocks
  const mockedSellers = sellerUsers.map(
    ({ id }): Seller => ({
      userId: id,
    }),
  );

  // Insert seeds
  await db.insert(sellersSchema).values(mockedSellers);

  console.log(`Seeding completed for: ${TABLE_SELLERS}`);
};
