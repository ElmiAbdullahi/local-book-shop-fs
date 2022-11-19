const pool = require('../lib/utils/pool.js');
const setup = require('../data/setup.js');
const request = require('supertest');
const app = require('../lib/app');

describe('authors route', () => {
  beforeEach(() => {
    return setup(pool);
  });
});

it('/authors should return list of book', async () => {
  const res = await request(app).get('/authors');
  expect(res.body.length).toEqual(5);
  expect(res.body[0]).toEqual({
    id: expect.any(String),
    name: expect.any(String),
    dob: expect.any(Number),
    pob: expect.any(String),
  });
});
