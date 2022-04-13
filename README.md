# CSCE606 - Project Plannxt

Environment:

* Ruby version - 3.1.0

* Rails version - v7.0.2.2

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

Unit Test:

1 "test add a new item"
 test add a new item into the database. This could add a new item into the fixtures of database and check if it works  
2 "check data plan1 with id 1" 
 "plan1" is a sample data that already exist in the original fixtures of database. This would test the database lookup.

API:
PlanModel:
 Read: GET /plan_models_json/:id
 New: POST /plan_models_json
 Update: POST /plan_models_json/:id
 Delete: DELETE /plan_models_json/:id
