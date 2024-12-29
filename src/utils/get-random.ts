export const getRandomString = (strings: string[]) =>
  strings[Math.floor(Math.random() * strings.length)];
