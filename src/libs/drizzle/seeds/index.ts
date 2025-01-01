import { seedClients } from './seed-clients';
import { seedInitialData } from './seed-initial-data';
import { seedOrders } from './seed-orders';
import { seedProducts } from './seed-products';
import { seedSellers } from './seed-sellers';
import { seedUsersToUserRoles } from './seed-users-to-user-roles';

// Insert all seeds
const main = async () => {
  await seedInitialData();
  await seedProducts();
  await seedUsersToUserRoles();
  await seedSellers();
  await seedClients();
  await seedOrders();
};
main();
