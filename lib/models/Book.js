const pool = require('../utils/pool.js');

module.exports = class Book {
  id;
  title;
  release;

  constructor(row) {
    this.id = row.id;
    this.title = row.title;
    this.title = row.release;
  }

  static async getAll() {
    const { rows } = await pool.query('SELECT * from books');
    return rows.map((bookRow) => new Book(bookRow));
  }
};
