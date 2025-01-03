import { NODE_ENV } from '@/config/env';
import { seedBaseTables } from './seed-base-tables';
import { seedClients } from './seed-clients';
import { seedOrders } from './seed-orders';
import { seedOrdersToProducts } from './seed-orders-to-products';
import { seedProducts } from './seed-products';
import { seedSellers } from './seed-sellers';
import { seedUsersToUserRoles } from './seed-users-to-user-roles';
import { truncateTables } from './truncate-tables';

const seedDatabase = async () => {
  // Reset tables
  await truncateTables();

  // Seed: no requirements
  await seedBaseTables();

  // Seed: requires base tables to be seeded
  await seedProducts();
  await seedUsersToUserRoles();

  // Seed: requires usersToUserRoles to be seeded
  await seedSellers();
  await seedClients();

  // Seed: requires sellers and clients to be seeded
  await seedOrders();

  // Seed: requires products and orders to be seeded
  await seedOrdersToProducts();
};

// Run script only in development environment
if (NODE_ENV !== 'production') seedDatabase();
