import { NODE_ENV } from '@/config/env';
import { truncateTables } from './truncate-tables';
import { seedClients } from './utils/seed-clients';
import { seedInitialData } from './utils/seed-initial-data';
import { seedOrders } from './utils/seed-orders';
import { seedOrdersToProducts } from './utils/seed-orders-to-products';
import { seedProducts } from './utils/seed-products';
import { seedSellers } from './utils/seed-sellers';
import { seedUsersToUserRoles } from './utils/seed-users-to-user-roles';

// Insert all seeds
const seedDatabase = async () => {
  // Reset tables
  await truncateTables();

  // Seed data
  await seedInitialData();

  // Requires initial data to be seeded
  await seedProducts();
  await seedUsersToUserRoles();

  // Requires usersToUserRoles to be seeded
  await seedSellers();
  await seedClients();

  // Requires sellers and clients to be seeded
  await seedOrders();

  // Requires products and orders to be seeded
  await seedOrdersToProducts();
};

// Run script only in development environment
if (NODE_ENV !== 'production') seedDatabase();
