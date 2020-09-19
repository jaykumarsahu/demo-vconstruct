### Used Gems
- `faraday` to make http calls
- `activerecord-import` to bulk inserting data into database using ORM

### JavaScript Library Binding
- JQuery

### Ruby Version
- 2.7.0

### Rails Version
- 6.0.3

### Instructions
1. run `bundle install` to load all gem dependencies
2. update `database.yml` to establish the database connection
3. run `rake import:products` to import products from 3rd party API
4. run `rails s` to up to application
5. open `localhost:3000` on browser
