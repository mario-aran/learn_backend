import { fakerLocale } from '@/libs/faker/faker-locale';
import { db } from './db';
import { clientsSchema } from './schemas';

// Types
type InsertClient = typeof clientsSchema.$inferInsert;

// Constants
const SEEDS_LENGHT = 20;

const seedClients = async () => {
  await db.delete(clientsSchema); // Reset table
  await db.execute('ALTER SEQUENCE clients_id_seq RESTART WITH 1'); // Reset sequence

  // Create values
  const clients = Array.from(
    { length: SEEDS_LENGHT },
    (): InsertClient => ({
      name: fakerLocale.person.firstName(),
    }),
  );

  await db.insert(clientsSchema).values(clients);
};

seedClients();
