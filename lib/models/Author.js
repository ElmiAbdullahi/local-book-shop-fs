const pool = require('../utils/pool.js');

module.exports = class Author {
  id;
  name;
  dob;
  pob;

  constructor(row) {
    this.id = row.id;
    this.name = row.name;
    this.dob = row.dob;
    this.pob = row.pob;
  }

  static async getAll() {
    const { rows } = await pool.query('SELECT * from authors');
    return rows.map((authorRow) => new Author(authorRow));
  }
  static async getById(id) {
    const { rows } = await pool.query(
      `
        select authors.*,

        coalesce(
            json_agg(to_jsonb(books))
            filter (WHERE books.id IS NOT NULL), '[]') as books
        from authors
        left join books_authors on authors.id = books_authors.authors_id
        left join books on authors.id = books_authors.authors_id
        WHERE authors.id = $1
        group by authors.id

        `,
      [id]
    );
    return rows[0];
  }
};
