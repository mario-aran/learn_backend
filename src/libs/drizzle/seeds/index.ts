import { NODE_ENV } from '@/config/env';
import { db } from '@/libs/drizzle/db';
import { seedBaseTables } from './seed-base-tables';
import { seedClients } from './seed-clients';
import { seedOrders } from './seed-orders';
import { seedOrdersToProducts } from './seed-orders-to-products';
import { seedProducts } from './seed-products';
import { seedSellers } from './seed-sellers';
import { seedUsersToUserRoles } from './seed-users-to-user-roles';
import { truncateTables } from './truncate-tables';

const seedDatabase = async () => {
  try {
    await db.transaction(async (tx) => {
      // Reset tables
      await truncateTables(tx);

      // Seed: no requirements
      await seedBaseTables(tx);

      // Seed: requires base tables to be seeded
      await seedProducts(tx);
      await seedUsersToUserRoles(tx);

      // Seed: requires usersToUserRoles to be seeded
      await seedSellers(tx);
      await seedClients(tx);

      // Seed: requires sellers and clients to be seeded
      await seedOrders(tx);

      // Seed: requires products and orders to be seeded
      await seedOrdersToProducts(tx);
    });

    console.log('Database seeded successfully');
  } catch (err) {
    // Error type assertion
    const errorMessage = err instanceof Error ? err.message : 'Unknown error';
    throw new Error(`Seeding error: ${errorMessage}`);
  }
};

// Run script only in development
if (NODE_ENV === 'production')
  throw new Error('Seeding not allowed in production');
seedDatabase();
