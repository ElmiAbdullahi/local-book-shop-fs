const pool = require('../lib/utils/pool.js');
const setup = require('../data/setup.js');
const request = require('supertest');
const app = require('../lib/app');

describe('books routes', () => {
  beforeEach(() => {
    return setup(pool);
  });

  it('/books should return list of books', async () => {
    const res = await request(app).get('/books');
    expect(res.body.length).toEqual(7);
    expect(res.body[0]).toEqual({
      id: expect.any(String),
      title: expect.any(String),
      released: expect.any(Number),
    });
  });

  // it('/books/1 should return a book detail with authors', async () => {
  //   const res = await request(app).get('/books/1');
  //   console.log(res.body);
  //   expect(res.body).toEqual({
  //     title: expect.any(String),
  //     released: expect.any(Number),
  //     authors: expect.any(String),
  //   });
  // });

  afterAll(() => {
    pool.end();
  });
});
