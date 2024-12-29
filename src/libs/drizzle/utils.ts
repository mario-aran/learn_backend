import { db } from '@/libs/drizzle/db';
import { Schema, Seed } from '@/libs/drizzle/types';
import { sql } from 'drizzle-orm';

// Queries
export const queryRandomId = async (schema: Schema) => {
  const records = await db
    .select()
    .from(schema)
    .orderBy(sql`RANDOM()`)
    .limit(1);

  return (records[0].id as string) || '';
};

// Seeds
export const createSeed = <T extends Schema>(
  schema: T,
  mockRecord: T['$inferInsert'],
  recordsLength = 10,
) => ({
  schema,
  records: Array.from({ length: recordsLength }, () => mockRecord),
});

export const insertSeeds = async (seeds: Seed[]) => {
  const promises = seeds.map(({ schema, records }) =>
    db.insert(schema).values(records),
  );

  return Promise.all(promises);
};
