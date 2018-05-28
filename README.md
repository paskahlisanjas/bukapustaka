# VirtuLib (Backend)

VirtuLib is an online library that allows the users to lend or return a book. The backend itself is built in ruby on rails.

# API access

### Book

| Method | Route | Params | Usage |
| ------ | ----- | ------ | ----- |
| GET | /books | - | to retrieve all the books recorded |
| POST | /books | `start`, `finish` | to retrieve all the books which id is between `start` and `finish` |
| GET | /books/`id` | - | to retrieve a book which id matches `id` |
| GET | /books/`id`/borrow | - | to borrow a book which id matches `id` <b>(authorization needed)</b> |
| GET | /books/`id`/return | - | to return a book which id matches `id` <b>(authorization needed)</b> |

### User

| Method | Route | Params | Usage |
| ------ | ----- | ------ | ----- |
| POST | /login | `email`, `password` | to sign user in and get the authorization token  |
| POST | /register | `name`, `email`, `password` | to register user and get the authorization token |

### Authorization (optional)

This is optional because the above access is already fulfill the authorization requirement.

| Method | Route | Params | Usage |
| ------ | ----- | ------ | ----- |
| GET | /auth | -  | to check user authorization |

Note that the authorization type is <b>Bearer Token</b>. The request needs to specify its `auth_token` in the header with `Authorization` as the key.
