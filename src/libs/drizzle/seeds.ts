import { insertSeeds } from '@/libs/drizzle/utils';
import { seedsStep1, seedsStep2, seedsStep3, seedsStep4 } from './seeds-steps';

// Values
const seeds = [seedsStep1, seedsStep2, seedsStep3, seedsStep4];

const main = async () => {
  for (const seed of seeds) {
    await insertSeeds(seed);
  }
};
main();
