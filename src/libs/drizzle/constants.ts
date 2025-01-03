// Types
export type UserRole = (typeof USER_ROLES)[keyof typeof USER_ROLES];
export type ProductCategory =
  (typeof PRODUCT_CATEGORIES)[keyof typeof PRODUCT_CATEGORIES];
export type ClientDiscount = (typeof CLIENT_DISCOUNTS)[number];

// Constants
export const SEEDS_LENGTH = 20;

export const USER_ROLES = {
  SELLER: 'seller',
  CLIENT: 'client',
} as const;

export const PRODUCT_CATEGORIES = {
  BASIC: 'basic',
  MEDIUM: 'medium',
  PREMIUM: 'premium',
} as const;

export const CLIENT_DISCOUNTS = [
  '0.10',
  '0.15',
  '0.20',
  '0.25',
  '0.30',
] as const;
