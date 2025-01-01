import { seedInitialData } from './seed-initial-data';
import { seedProducts } from './seed-products';
import { seedSellers } from './seed-sellers';

// Insert all seeds
const main = async () => {
  await seedInitialData();
  await seedProducts();
  // await seedUsersToUserRoles();
  await seedSellers();
  // await seedClients();
};
main();
