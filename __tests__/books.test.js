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
  });

  afterAll(() => {
    pool.end();
  });
});
