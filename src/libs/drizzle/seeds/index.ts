import { seedInitialData } from './seed-initial-data';
import { seedProducts } from './seed-products';

// Insert all seeds
const main = async () => {
  await seedInitialData();
  await seedProducts();
};
main();
