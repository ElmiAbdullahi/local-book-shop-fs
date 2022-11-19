const { Router } = require('express');
const Author = require('../models/Author.js');

module.exports = Router()
  .get('/', async (req, res) => {
    const authors = await Author.getAll();
    const filtered = authors.map(({ id, name }) => ({ id, name }));
    res.json(filtered);
  })
  .get('/:id', async (req, res) => {
    const author = await Author.getById(req.params.id);

    res.json(author);
  });
