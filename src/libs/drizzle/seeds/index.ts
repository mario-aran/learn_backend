import { seedClients } from './seed-clients';
import { seedInitialData } from './seed-initial-data';
import { seedOrders } from './seed-orders';
import { seedOrdersToProducts } from './seed-orders-to-products';
import { seedProducts } from './seed-products';
import { seedSellers } from './seed-sellers';
import { seedUsersToUserRoles } from './seed-users-to-user-roles';

// Insert all seeds
const seedDatabase = async () => {
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
seedDatabase();
