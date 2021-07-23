# Agile English API

Agile English it's an app in which you can schedule an appointment with your online English teacher, everything is easy and accessible. This repository is the API created in Ruby on Rails that fulfills the front-end React app. 

PostgreSQL is used for the database and it's deployed on Heroku.
## Deployed API

<a href="https://agile-english-api.herokuapp.com/api/v1/lectures">Check the API data here</a>

## Built With

- Ruby 2.7.2
- Ruby on Rails 6.1.4
- PostgreSQL
- Rspec gem
- JWT

### Agile English API Documentation

This API it's open for anyone, this means that you don't need an API key to access the data.

The Entity Relationship Diagram used in the database:

IMAGE

**Allowed HTTPS requests:**

POST: To update resource
GET: Get a resource or list of resources
DELETE: To delete a resource

**Description Of Usual Service Responses:**

- 200 OK - the request was successful
- 204 No Content - the request was successful but there is no representation to return
- 400 Bad Request - the request could not be understood or was missing required parameters
- 401 Unauthorized - authentication failed or user doesn't have permissions for requested operation
- 403 Forbidden - access denied
- 404 Not Found - resource was not found
- 405 Method Not Allowed - requested method is not supported for resource.

**Endpoints:**

| Method | Endpoint | Functionality |
|:------:|:--------:|:-------------:|
|POST    |/api/v1/login|Log users|
|POST| /api/v1/register|Create users|
|POST    | /api/v1/appointments|Create appointment|
|GET     |/api/v1/lectures|Get all lectures|
|GET     |/api/v1/appointments| Get all appointments|
|DELETE  |/api/v1/appointments| Delete an appointment|
|GET     |/api/v1/users       |Get all users(admin)|
|GET     |/api/v1/admin/appointments|Get all appointments(admin)|
### Setup

To run this project locally, please ensure you have Ruby and Ruby on Rails installed on your machine, then clone this repository by running.

```bash
git clone https://github.com/mricanho/ae-backend.git
```
Open your terminal and CD to the directory where you create the clone repository.

Now run:

```bash
bundle install
```

To setup the database run:

```bash
rails db:create
rails db:migrate
```
It's super important to populate the app, so now run:

```bash
rails db:seed
```
To set up the server put:
```bash
rails s
```
After this you can open your favorite web-browser and copy paste the next:

```bash
http://localhost:3000/api/v1/lectures
```

### Tests

To check the tests, just run:

```bash
rspec
```
### Author

👤 *Miguel Ricaño*

- Github: [@mricanho](https://github.com/mricanho)
- Linkedin: [Miguel Ricaño](https://www.linkedin.com/in/mricanho/)

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

## 📝 License

This project is [MIT](LICENSE) licensed.
