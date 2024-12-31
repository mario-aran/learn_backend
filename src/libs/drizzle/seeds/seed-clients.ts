import { USER_ROLES } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { clientsSchema, userRolesSchema } from '@/libs/drizzle/schemas';
import { Client } from '@/libs/drizzle/types';
import { eq } from 'drizzle-orm';

export const seedClients = async () => {
  // Fetch all possible clients to insert
  const values: Client[] = await db.query.clientsSchema.findMany({
    columns: { clientDiscountId: true, userId: true },
    with: {
      clientDiscount: true,
      user: { with: { usersToUserRoles: { with: { userRole: true } } } },
    },
    where: eq(userRolesSchema.name, USER_ROLES.CLIENT),
  });
  if (!values.length) throw new Error('No clients found');

  // Insert values into the database
  const result = await db.insert(clientsSchema).values(values);
  console.log('clientSchema seeded');
  return result;
};
