import { SEEDS_LENGTH } from '@/libs/drizzle/constants';
import { db } from '@/libs/drizzle/db';
import { Schema, Seed } from '@/libs/drizzle/types';
import { faker } from '@faker-js/faker';
import { sql } from 'drizzle-orm';

const genRecords = <T extends object>(generator: () => T) =>
  Array.from({ length: SEEDS_LENGTH }, generator);

export const getRandomObjFromArr = <T extends object>(arr: T[]) =>
  arr[Math.floor(Math.random() * arr.length)];

// Queries
export const getRandomIdFromSchema = async <T extends Schema>(schema: T) => {
  const [record] = await db
    .select()
    .from(schema)
    .orderBy(sql`RANDOM()`)
    .limit(1);

  if (!record || !record.id) throw new Error('No id found');
  return record.id;
};

// Seeds
export const insertSeeds = async (seeds: Seed[]) => {
  const promiseArr = seeds.map(({ schema, records }) =>
    db.insert(schema).values(records),
  );

  return Promise.all(promiseArr);
};

// Mocks
export const mockProductQuantities = genRecords(() => ({
  quantity: faker.number.int({ min: 1, max: 10 }),
}));
