// Remove optional keys from object type
export type RequiredKeys<T> = {
  [K in keyof T as undefined extends T[K] ? never : K]: T[K];
};
