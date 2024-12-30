import { seedsBatch1 } from './seeds-batch1';
import { seedsBatch2 } from './seeds-batch2';

// Values
const seeds = [seedsBatch1, seedsBatch2];

// Insert all seeds
const main = async () => {
  for (const seedsBatch of seeds) {
    await Promise.all(seedsBatch);
  }
};
main();
