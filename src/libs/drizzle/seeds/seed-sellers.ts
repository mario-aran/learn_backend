import { USER_ROLES } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { sellersSchema, usersToUserRolesSchema } from '@/libs/drizzle/schemas';
import { Seller } from '@/libs/drizzle/types';
import { findUserRoleIdByName } from '@/libs/drizzle/utils';
import { eq } from 'drizzle-orm';

export const seedSellers = async () => {
  // Fetch seller user role id
  const sellerUserRoleId = await findUserRoleIdByName(USER_ROLES.SELLER);

  // Fetch seller user ids
  const sellerUserIds = await db.query.usersToUserRolesSchema.findMany({
    columns: { userId: true },
    where: eq(usersToUserRolesSchema.userRoleId, sellerUserRoleId),
  });
  if (!sellerUserIds.length) throw new Error('No seller user ids found');

  // Prepare mocked data
  const mockedSellers = sellerUserIds.map(
    ({ userId }): Seller => ({
      userId,
    }),
  );

  // Insert seeds
  const result = await db.insert(sellersSchema).values(mockedSellers);
  console.log('Seeding completed for: sellers');
  return result;
};
