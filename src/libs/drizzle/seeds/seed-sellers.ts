import { db } from '@/libs/drizzle/db';
import { sellersSchema, userRolesSchema } from '@/libs/drizzle/schemas';
import { eq } from 'drizzle-orm';
import { USER_ROLES } from './constants';

// Types
type Seller = typeof sellersSchema.$inferInsert;

export const seedSellers = async () => {
  // Queries
  const sellerUsers = await db.query.usersSchema.findMany({
    columns: { id: true },
    where: eq(userRolesSchema.name, USER_ROLES.SELLER),
  });
  if (sellerUsers.length === 0) throw new Error('No seller users found');

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
