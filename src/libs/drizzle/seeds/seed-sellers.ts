import { USER_ROLES } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { sellersSchema, usersToUserRolesSchema } from '@/libs/drizzle/schemas';
import { Seller } from '@/libs/drizzle/types';
import { findUserRoleIdByName } from '@/libs/drizzle/utils';
import { eq } from 'drizzle-orm';

export const seedSellers = async () => {
  // Fetch sellerUserRoleId
  const sellerUserRoleId = await findUserRoleIdByName(USER_ROLES.SELLER);

  // Fetch all userIds that have "seller" as userRole
  const sellerUserIds = await db.query.usersToUserRolesSchema.findMany({
    columns: { userId: true },
    where: eq(usersToUserRolesSchema.userRoleId, sellerUserRoleId),
  });
  if (!sellerUserIds.length) throw new Error('No sellerUserIds found');

  // Prepare values
  const values = sellerUserIds.map(
    ({ userId }): Seller => ({
      userId,
    }),
  );

  // Insert values into the database
  const result = await db.insert(sellersSchema).values(values);
  console.log('sellersSchema seeded');
  return result;
};
