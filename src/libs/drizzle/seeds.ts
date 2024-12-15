import { faker } from '@/libs/faker';
import { db } from './db';
import { clientsSchema, products } from './schemas';

// Types
type InsertClient = typeof clientsSchema.$inferInsert;

// Constants
const SEEDS_LENGHT = 10;

const seedClients = async () => {
  const clients = Array.from(
    { length: SEEDS_LENGHT },
    (): InsertClient => ({
      name: faker.person.firstName(),
    }),
  );

  await db.insert(clientsSchema).values(clients);
};

seedClients();
