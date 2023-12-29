# ElixirPdiPhoenixApi

This project was developed for the PDI `Learning a new programming language (Elixir)`

Run in production: 
  * Run `docker compose up` to build docker image and start the application

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To start your Phoenix server in development:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
  * Other developments commands
    * `mix ecto.gen.migration add_users_table`
    * `mix ecto.gen.migration add_accounts_table`
    * `mix ecto.migrate`
    * `mix ecto.reset`
    * `mix compile`
    * `mix format --check-formatted`
    * `mix test`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Users

### Create user

Create user a new user: cURL example

```curl
curl --location --request POST 'http://localhost:4000/api/users' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "João",
    "email": "joao1@gmail.com",
    "cep": "12345678",
    "password": "123456"
}'
```

<details>
  <summary>User created with success response example</summary>

  ```http
  HTTP/1.1 201 Created
  cache-control: max-age=0, private, must-revalidate
  content-length: 114
  content-type: application/json; charset=utf-8
  date: Fri, 29 Dec 2023 15:27:53 GMT
  server: Cowboy
  x-request-id: F6VW-8CD8BVNsaAAAALh
  
  {"data":{"cep":"12345678","email":"joao1@gmail.com","id":1,"name":"João"},"message":"User created with success!"}
```
</details>

### User login
Generate Bearer token for user: cURL example

```curl
curl --location --request POST 'http://localhost:4000/api/users/login' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email": "joao1@gmail.com",
    "password": "123456"
}'
```

<details>
  <summary>User created with success response example</summary>

  ```http
  HTTP/1.1 200 OK
  cache-control: max-age=0, private, must-revalidate
  content-length: 156
  content-type: application/json; charset=utf-8
  date: Fri, 29 Dec 2023 15:35:45 GMT
  server: Cowboy
  x-request-id: F6VXaaHl7hnJeScAAANh
  
  {"bearer":"SFMyNTY.g2gDdAAAAAFkAAd1c2VyX2lkYQFuBgCTlje2jAFiAAFRgA.w6S4JrSxpaRfWQ5a-alMOPXwtEHZdCwNjP7rTs67Pls","message":"User authenticated with success!"}
  ```
</details>

### Retrieve a user
Retrieve a user from ID: cURL example

```curl
curl --location --request GET 'http://localhost:4000/api/users/1' \
--header 'Authorization: Bearer SFMyNTY.g2gDdAAAAAFkAAd1c2VyX2lkYQFuBgCTlje2jAFiAAFRgA.w6S4JrSxpaRfWQ5a-alMOPXwtEHZdCwNjP7rTs67Pls'
```

<details>
  <summary>User retrieved with success response example</summary>

  ```http
  HTTP/1.1 200 OK
  cache-control: max-age=0, private, must-revalidate
  content-length: 75
  content-type: application/json; charset=utf-8
  date: Fri, 29 Dec 2023 15:40:56 GMT
  server: Cowboy
  x-request-id: F6VXslIPWD0lWagAAAAC
  
  {"data":{"cep":"12345678","email":"joao1@gmail.com","id":1,"name":"João"}}
  ```
</details>

### Update a user
Update a user from ID: cURL example

```curl
curl --location --request PUT 'http://localhost:4000/api/users/1' \
--header 'Authorization: Bearer SFMyNTY.g2gDdAAAAAFkAAd1c2VyX2lkYQFuBgCTlje2jAFiAAFRgA.w6S4JrSxpaRfWQ5a-alMOPXwtEHZdCwNjP7rTs67Pls' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "João 1 atualizado",
    "cep": "83406333"
}'
```

<details>
  <summary>User updated with success response example</summary>

  ```http
  HTTP/1.1 200 OK
  cache-control: max-age=0, private, must-revalidate
  content-length: 127
  content-type: application/json; charset=utf-8
  date: Fri, 29 Dec 2023 15:43:46 GMT
  server: Cowboy
  x-request-id: F6VX2gT8W4GKzK0AAAOB
  
  {"data":{"cep":"83406333","email":"joao1@gmail.com","id":1,"name":"João 1 atualizado"},"message":"User updated with success!"}
  ```
</details>

### Delete a user
Delete a user from ID: cURL example

```curl
curl --location --request DELETE 'http://localhost:4000/api/users/1' \
--header 'Authorization: Bearer SFMyNTY.g2gDdAAAAAFkAAd1c2VyX2lkYQFuBgCTlje2jAFiAAFRgA.w6S4JrSxpaRfWQ5a-alMOPXwtEHZdCwNjP7rTs67Pls'
```

<details>
  <summary>User updated with success response example</summary>

  ```http
  HTTP/1.1 200 OK
  cache-control: max-age=0, private, must-revalidate
  content-length: 88
  content-type: application/json; charset=utf-8
  date: Fri, 29 Dec 2023 15:45:22 GMT
  server: Cowboy
  x-request-id: F6VX8CiZZZQA2TQAAABC
  
  {"data":{"cep":"83406333","email":"joao1@gmail.com","id":1,"name":"João 1 atualizado"}}
  ```
</details>

## Accounts

### Create a account for a user
Create a account for a user ID: cURL example

```curl
curl --location --request POST 'http://localhost:4000/api/accounts' \
--header 'Authorization: Bearer SFMyNTY.g2gDdAAAAAFkAAd1c2VyX2lkYQFuBgCTlje2jAFiAAFRgA.w6S4JrSxpaRfWQ5a-alMOPXwtEHZdCwNjP7rTs67Pls' \
--header 'Content-Type: application/json' \
--data-raw '{
    "user_id": 1,
    "balance": 1000
}'
```

<details>
  <summary>Account creates with success response example</summary>

  ```http
  HTTP/1.1 201 Created
  cache-control: max-age=0, private, must-revalidate
  content-length: 88
  content-type: application/json; charset=utf-8
  date: Fri, 29 Dec 2023 16:30:26 GMT
  server: Cowboy
  x-request-id: F6VaZcd9fxOUynsAAAAh
  
  {"data":{"balance":"1000","id":1,"user_id":1},"message":"Account created with success!"}
  ```
</details>

### Create a transaction between users account
Create a transaction between users from account ID: cURL example

```curl
curl --location --request POST 'http://localhost:4000/api/accounts/transaction' \
--header 'Authorization: Bearer SFMyNTY.g2gDdAAAAAFkAAd1c2VyX2lkYQFuBgCTlje2jAFiAAFRgA.w6S4JrSxpaRfWQ5a-alMOPXwtEHZdCwNjP7rTs67Pls' \
--header 'Content-Type: application/json' \
--data-raw '{
    "from_account_id": 1,
    "to_account_id": 2,
    "value": 100
}'
```

<details>
  <summary>Transaction completed with success response example</summary>

  ```http
  HTTP/1.1 200 OK
  cache-control: max-age=0, private, must-revalidate
  content-length: 147
  content-type: application/json; charset=utf-8
  date: Fri, 29 Dec 2023 16:34:37 GMT
  server: Cowboy
  x-request-id: F6VaoB4dN4pV-EYAAABH
  
  {"from_account":{"balance":"900","id":1,"user_id":1},"message":"transaction completed success!","to_account":{"balance":"1100","id":2,"user_id":2}}
  ```
</details>