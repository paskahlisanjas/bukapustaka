# VirtuLib (Backend)

Virtual library is an online library that allows the users to lend or return a book. The backend itself is built in ruby on rails.

# API access

| Method | Route | Params | Usage |
| --- | --- | --- | --- | ---|
| GET | /books | - | to retrieve all the books recorded |
| POST | /books | `start`, `finish` | to retrieve all the books which id is between `start` until `finish` |
| GET | /books/`id` | - | to retrieve a book which id matches `id` |

to be continued ...
