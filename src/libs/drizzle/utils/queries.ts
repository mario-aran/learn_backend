import { db } from '@/libs/drizzle/db';
import { Schema } from '@/libs/drizzle/types';
import { sql } from 'drizzle-orm';

export const queryRandomId = async (schema: Schema) => {
  const records = await db
    .select()
    .from(schema)
    .orderBy(sql`RANDOM()`)
    .limit(1);

  return (records[0].id as string) || '';
};
