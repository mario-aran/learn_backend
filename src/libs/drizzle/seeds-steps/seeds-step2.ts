import {
  clientsSchema,
  productsSchema,
  sellersSchema,
  usersToUserRolesSchema,
} from '@/libs/drizzle/schemas';
import {
  createSeed,
  mockProductName,
  mockProductUnitPrice,
} from '@/libs/drizzle/utils';

// Seed definitions
const usersToUserRoles = createSeed(usersToUserRolesSchema, {
  userId: '',
  userRoleId: '',
});

const sellers = createSeed(sellersSchema, {
  userId: '',
});

const clients = createSeed(clientsSchema, {
  clientDiscountId: '',
  userId: '',
});

const products = createSeed(productsSchema, {
  productCategoryId: '',
  name: mockProductName(),
  unitPrice: mockProductUnitPrice(),
});

// Combine and export all seeds
export const seedsStep2 = [usersToUserRoles, sellers, clients, products];
