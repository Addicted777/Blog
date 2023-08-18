# README

## Init project
  * Destroy any existing containers with conflicting names.
  
  * Copy `.env.example` to `.env` and modify (if required)

  * Copy `config/database.example.yml` to `config/database.yml` and modify (if required)

  * Build an image for Ruby on Rails:
    ```
    docker-compose build
    ```
  * Boot up the app by running (for Mac see section below):
    ```
    docker-compose up
    ```
  * Create databases by running:
    ```
      docker-compose exec web rake db:create
    ```
  * Run database migrations:
    ```
      docker-compose exec web rake db:migrate
    ```

Now your Rails app should be available at
[localhost:3000](http://localhost:3000).