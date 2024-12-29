import { insertSeeds } from '@/libs/drizzle/utils';
import { seedsStep1 } from './seeds-step1';

// Values
const seeds = [seedsStep1];

const main = async () => {
  for (const seed of seeds) {
    await insertSeeds(seed);
  }
};
main();
