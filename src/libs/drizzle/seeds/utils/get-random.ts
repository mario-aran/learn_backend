export const getRandomIdFromObjs = (objs: { id: string }[]) =>
  objs[Math.floor(Math.random() * objs.length)].id;
