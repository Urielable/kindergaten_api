## Kindergaten api

Kinedu api exercise.

### Requirements:
Ruby Version: **2.6.3**

Rails Version: **6.0.2**

Mysql

#### Installation

Run:

```
bundle install
```

#### Configuration

You need create the enviroment variables:

```
export KINEDU_APP_KEY=<yourappkey>
export DATABASE_URL="mysql2://myuser:mypass@localhost/somedatabase"
export KINEDU_APP_DB_TEST=kinedu_test
export KINEDU_APP_DB_HOST=interfactura_app
export KINEDU_APP_DB_USER=<your user>
export KINEDU_APP_DB_PASS=<your pass>
```

Or modify directly teh `database.yml`, you can feel free of use any method.

**Create database:**

```
rake db:create
```

Connect to database for load data, use file 'demo_2019-04-04.sql'.

Run migrations for create user entities.

```
rake db:migrate
```

**Run server:**

```
rails s
```

## How to use

You can use the live demo [https://api.miss-line.com](https://api.miss-line.com).

The demo is mount in AWS EC2.

You can view api docs in the [wiki](https://github.com/Urielable/kindergarten_api/wiki).

### TO-DO

- Test suite


