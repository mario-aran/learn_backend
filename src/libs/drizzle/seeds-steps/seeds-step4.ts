import { ordersToProductsSchema } from '@/libs/drizzle/schemas';
import { createSeed } from '@/libs/drizzle/utils';

// Seed definitions
const ordersToProducts = createSeed(ordersToProductsSchema, {
  orderId: '',
  productId: '',
  unitPrice: '',
  discount: '',
  quantity: '',
});

// Combine and export all seeds
export const seedsStep4 = [ordersToProducts];
