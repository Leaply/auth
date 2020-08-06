# Leaply Auth

Authentication and User Management Service for the Leaply platform.

This service is responsible for allowing users to register on the Leaply 
platform and subsequently to log in to their account. This can be done
via HTML forms (HTTP POST) or through a RESTful API using JSON. Doing so
provides a JSON Web Token which can be stored by the user and used in API
requests to all Leaply services.

It also acts as OAuth consumer and provider, allowing users to authenticate
themselves using an account from another platform (e.g. Google or LinkedIn)
and also to use their Leaply account to sign in to other services (though, the
latter won't be implemented until needed.)

## Details

- Ruby 2.7 and Rails 6
- Tailwind CSS / UI
- PostgreSQL 12
- JSON Web Tokens (JWT)

## Maintainers

- Michael Prins (Leaply)
