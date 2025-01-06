import { NODE_ENV } from '@/config/env';
import { seedBaseTables } from './seed-base-tables';
import { seedClients } from './seed-clients';
import { seedOrders } from './seed-orders';
import { seedOrdersToProducts } from './seed-orders-to-products';
import { seedProducts } from './seed-products';
import { seedSellers } from './seed-sellers';
import { seedUsers } from './seed-users';
import { truncateTables } from './truncate-tables';

const seedDatabase = async () => {
  try {
    // Reset tables
    await truncateTables();

    // Seed: no requirements
    await seedBaseTables();

    // Seed: requires base tables to be seeded
    await seedProducts();
    await seedUsers();

    // Seed: requires users to be seeded
    await seedSellers();
    await seedClients();

    // Seed: requires sellers and clients to be seeded
    await seedOrders();

    // Seed: requires orders and products to be seeded
    await seedOrdersToProducts();

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
