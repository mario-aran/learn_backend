import { ordersSchema } from '@/libs/drizzle/schemas';
import { createSeed } from '@/libs/drizzle/utils';

// Seed definitions
const orders = createSeed(ordersSchema, {
  sellerId: '',
  clientId: '',
});

// Combine and export all seeds
export const seedsStep3 = [orders];
