# fsocietyxxx API

Create, read, update, delete in a Node.js app with an Express server and Postgres database.

## How to Run
Change to the directory you store the files within inside Terminal

```
cd /Users/_username_/Desktop/Development/fsocietyxxx/api
```

then execute

```
node index.js
```

and you should see a return of
```
App running on port 3000.
```

## Database

```bash
brew install postgresql
brew services start postgresql
psql postgres
```

```sql
CREATE ROLE me WITH LOGIN PASSWORD 'password';
ALTER ROLE me CREATEDB;
CREATE DATABASE api;
GRANT ALL PRIVILEGES ON DATABASE api TO me;
```

```bash
psql -d api -U me
```

```sql
CREATE TABLE users (
  ID SERIAL PRIMARY KEY,
  name VARCHAR(30),
  email VARCHAR(30)
);

INSERT INTO users (name, email)
  VALUES ('Jerry', 'jerry@example.com'), ('George', 'george@example.com');
```

## Installation

```bash
git clone git@github.com:taniarascia/node-api-postgres
cd node-api-postgres
npm install
node index.js
```

## Commands

- GET: `curl http://localhost:3000/users`
- POST: `curl --data "name=Jerry&email=jerry@example.com" http://localhost:3000/users`
- PUT: `curl -X PUT -d "name=George" -d "email=george@example.com" http://localhost:3000/users/1`
- DELETE: `curl -X "DELETE" http://localhost:3000/users/1`

## Author

- [Tyler Phillips](https://www.tylercodes.co)

## License

This project is open source and available under the [MIT License](LICENSE).
