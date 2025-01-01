// Constants
export const USER_ROLES = {
  SELLER: 'seller',
  CLIENT: 'client',
} as const;

export const PRODUCT_CATEGORIES = {
  BASIC: 'basic',
  MEDIUM: 'medium',
  PREMIUM: 'premium',
} as const;

// Exported types
export type UserRole = (typeof USER_ROLES)[keyof typeof USER_ROLES];
export type ProductCategory =
  (typeof PRODUCT_CATEGORIES)[keyof typeof PRODUCT_CATEGORIES];
