# check-in-service

:bow: Please put your auspicious [Travis status button](http://docs.travis-ci.com/user/status-images/) here :bow:

1. [Overview](#overview)
2. [How Does It Work](#how-does-it-work)
3. [Endpoints](#endpoints)
4. [Development](#development)
5. [Extra Links](#extra-links)

### Overview

Simple check in service allowing loyal customers to receive rewards for frequent visits

### How Does It Work

Create a new business:

`` curl -X POST -d name="Taco King" -d password="tacos" -d code='1111' http://localhost:9393/businesses``

Add rewards:

`` curl -X POST -d business_id=1 -d password="tacos" -d visit_count=1 -d offer="Free taco" http://localhost:9393/rewards ``

Create User:

`` curl -X POST -d name='David' http://localhost:9393/users ``

Users can log visit by using business code, which can only be used once...

`` curl -X POST -d user_id=1 -d business_id=1 -d business_code='1111' http://localhost:9393/visits ``

And then check what rewards they have by making a request to /users/:user_id/rewards

`` curl -X GET -d business_id=1 http://localhost:9393/users/1/rewards ``

### Endpoints

```
GET        /hello(.:format)                         # Return a Hello World message
GET        /businesses(.:format)                    # Get a list of businesses
POST       /businesses(.:format)                    # Create a business
GET        /businesses/:id(.:format)                # Get a business
PUT        /businesses/:id(.:format)                # Update a business
POST       /businesses/:id/update_code(.:format)    # Update business code
GET        /users(.:format)                         # Get a list of users
POST       /users(.:format)                         # Create an user
GET        /users/:id(.:format)                     # Get an user
PUT        /users/:id(.:format)                     # Update an user
GET        /users/:id/rewards(.:format)             # Get user rewards
GET        /visits(.:format)                        # Get a list of check_ins
POST       /visits(.:format)                        # Create an check_in
GET        /visits/:id(.:format)                    # Get an check_in
PUT        /visits/:id(.:format)                    # Update an check_in
GET        /rewards(.:format)                       # Get a list of rewards
POST       /rewards(.:format)                       # Create an reward
GET        /rewards/:id(.:format)                   # Get an reward
PUT        /rewards/:id(.:format)                   # Update an reward
GET        /swagger_doc(.:format)                   # Swagger compatible API description
GET        /swagger_doc/:name(.:format)             # Swagger compatible API description for specific API
```

If those endpoints need to be explained in more detail, please bless us with your wisdom.

### Development

```
bundle install

rake db:reset

rspec spec

rackup
```

What else do we need to know so that a new developer can start contributing __within 30 minutes__?

### Extra Links

- https://github.com/bellycard/napa
