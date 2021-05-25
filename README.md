### Set up
1. `bundle install`
2. `bundle exec rails db:setup`
3. `bundle exec rails s`

### Requirements
* Set up your laptop and get a web framework running
* Configure a database connection and a schema based on the attached schema diagram
* Implement the ability for users to login with authentication and authorization
* Implement the ability for users to add, edit and delete a customer, project and task
* Seed your database with projects, customers and tasks (no admin interface is necessary)
* Implement the ability for users to log how much time they work on a task

## API

### Login
```
POST /api/v1/login HTTP/1.1
Content-Type: application/json

{
    "user" : {
        "email" : "test@gmail.com",
        "password": "123456"
    }
}
```

### Sign up
```
POST /api/v1/users HTTP/1.1
Content-Type: application/json

{
    "user" : {
        "email" : "world@gmail.com",
        "password": "pass"
    }
}
```

### Query customers
```
GET /api/v1/customers HTTP/1.1
Authorization: Bearer XXXXXXX
Content-Type: application/json

{
    "task_log" : {
        "duration_minutes" : 15
    }
}
```

### Create TaskLog
```
POST /api/v1/tasks/:id/task_logs HTTP/1.1
Authorization: Bearer XXXXXXX
Content-Type: application/json

{
    "task_log" : {
        "duration_minutes" : 15
    }
}
```
