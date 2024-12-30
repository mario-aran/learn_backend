import { insertSeeds } from '@/libs/drizzle/utils';
import { seedBatch1 } from './seed-batch1';
import { seedBatch2 } from './seed-batch2';

// Values
const seeds = [seedBatch1, seedBatch2];

// Insert all seeds
const main = async () => {
  for (const seedBatch of seeds) {
    await insertSeeds(seedBatch);
  }
};
main();
