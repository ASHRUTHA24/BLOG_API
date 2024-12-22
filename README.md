# Blogspot API

A simple blog API built with Ruby on Rails and JSON Web Tokens (JWT) for user authentication. This API allows users to register, log in, and create blog posts, with full CRUD functionality for posts. The API is built to follow RESTful conventions.

## Features
- User registration and login with JWT authentication
- Create, read, update, and delete blog posts
- Pagination for fetching posts
- Error handling for failed requests

## Technologies Used
- Ruby on Rails (v8.0.1)
- SQLite3 (Database)
- JWT (for authentication)
- Postman (for API testing)

## Setup Instructions

### Prerequisites
- Ruby (version 3.3.6 or later)
- Rails (version 8.0.1 or later)
- SQLite3 (for the database)
- Git (to clone the repository)

### Steps to Set Up Locally

1. **Clone the Repository**

   Clone the repository to your local machine:

   ```bash
   git clone https://github.com/ASHRUTHA24/Blogspot_API.git
   cd blogspot-api
   
2. **Install Dependencies**

   Install the required gems using Bundler:
   
   ```bash
   bundle install
   
3. **Set Up the Database**

   Set up and migrate the database:
   
   ```bash
   rails db:create
   rails db:migrate
   
4. **Generate a User (Optional)**

   You can create a user manually in the Rails console if you'd like:
   
   ```bash
   rails console
   User.create!(email: "user@example.com", password: "password") #Make sure to replace the email and password with your own values.

5. **Start the Rails Server**

   Start the Rails server:
   
   ```bash
   rails s
   
The server will be available at http://localhost:3000

6. **Testing with Postman**
   
6.1. **Register User (POST /signup):**
   
   To register a new user, make a POST request to http://localhost:3000/register with the following JSON body:
   
   json
   
      {
        "user": {
          "name": "sampleuser",
          "email": "user@example.com",
          "password": "password"
        }
      }
   
   This will return a token that can be used for authentication.

6.2. **Login User (POST /login):**

   To log in and receive a JWT token, make a POST request to http://localhost:3000/login with the following JSON body:
   
   json
      
      {
        "email": "user@example.com",
        "password": "password"
      }
   
   The response will contain a JWT token that you can use for authentication.

6.3. **Create Blog Post (POST /posts):**

   To create a blog post, use the Authorization header with the JWT token from the login response. Make a POST request to http://localhost:3000/posts with the following JSON body:
   
   json
      
      {
        "post": {
          "title": "My First Blog Post",
          "content": "This is the content of my first blog post."
        }
      }
   
6.4. **Get All Posts (GET /posts):**

   To retrieve a list of all posts, make a GET request to http://localhost:3000/posts. This will return a paginated list of blog posts.
   
6.5. **Get Post by id (GET /posts/):**

   To retrieve a list of all posts, make a GET request to http://localhost:3000/posts/:id. Replace :id with the post id.

6.6. **Update blog (PATCH /posts/):**

   URL: http://localhost:3000/posts/:id. Replace :id with the post id.
   Headers:
      Authorization: Bearer <your_token>
      
   Body: raw, JSON format
                  json
               
                  {
                    "post": {
                      "title": "Updated Title",
                      "content": "Updated content of the blog post."
                    }
                  }

6.7. **Delete blog (DELETE /posts/):**
 
 URL: http://localhost:3000/posts/:id. Replace :id with the post id.
 Headers:
    Authorization: Bearer <your_token>

 This deletes the blog_post
 
6.8. **Like a blog (Post / posts/):**

  URL: http://localhost:3000/posts/:id/like. Replace :id with the post id.
   Headers:
    Authorization: Bearer <your_token>

  This adds like to the post.
 
7. **Shut Down the Server**

   To stop the Rails server, press Ctrl+C in your terminal.

That's it the Blog API is ready!!!
