export const getRandomObjectId = (objs: { id: string }[]) =>
  objs[Math.floor(Math.random() * objs.length)].id;
