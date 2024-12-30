import { faker } from '@faker-js/faker';

// Constants
const MOCKS_LENGTH = 10;

// Utils
const genMocks = <T extends object>(genRecord: () => T) =>
  Array.from({ length: MOCKS_LENGTH }, genRecord);

// Mocks
export const mockUserRoles = ['Seller', 'Client'].map((name) => ({ name }));

export const mockUsers = faker.helpers
  .uniqueArray(faker.internet.email, MOCKS_LENGTH)
  .map((email) => ({
    name: faker.person.fullName(),
    email,
    password: faker.internet.password(),
  }));

export const mockClientDiscounts = (() => {
  const discounts = [];
  const start = 10;
  const end = 30;
  const step = 5;

  for (let i = start; i <= end; i += step) {
    discounts.push((i / 100).toFixed(2));
  }

  return discounts.map((discount) => ({ discount }));
})();

export const mockProductCategories = ['Basic', 'Medium', 'Premium'].map(
  (name) => ({ name }),
);

export const mockProductNames = faker.helpers
  .uniqueArray(faker.commerce.productName, MOCKS_LENGTH)
  .map((name) => ({ name }));

export const mockProductUnitPrices = genMocks(() => ({
  unitPrice: faker.commerce.price({ min: 100, max: 1000, dec: 2 }),
}));

export const mockProductQuantities = genMocks(() => ({
  quantity: faker.number.int({ min: 1, max: 10 }),
}));
