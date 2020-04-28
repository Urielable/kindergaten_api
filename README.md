## Kindergaten api

This api is for administrate activities in a kindergaten.

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
export KINDERGATEN_APP_KEY=<yourappkey>
export KINDERGATEN_APP_DB=kinedu_development
export KINDERGATEN_APP_DB_TEST=kinedu_test
export KINDERGATEN_APP_HOST=interfactura_app
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

#### Test suite

For execute test run:

```
rails test
```

## How to use

You can use the live demo [https://api.miss-line.com](https://api.miss-line.com).

The demo is mount in AWS EC2.

You can view api docs in the [wiki](https://github.com/Urielable/kindergaten_api/wiki).

## Activity Logs

#### List activity logs

Metodo: **GET**

Endpoint: `api/v1/babies/<baby_id>/activity_logs`

```bash
curl --request GET \
  --url http://<host>/api/v1/babies/5/activity_logs
```

Respuesta:

```json
{
  "activities": [
    {
      "activity_log_id": 101,
      "assistant_id": 5,
      "baby_id": 1,
      "comments": "todo chido",
      "assistant_name": "Samantha Porter",
      "baby_name": "Merritt",
      "start_time": "2018-03-17T17:30:00.000Z",
      "stop_time": "2018-03-17T18:30:00.000Z",
      "status": "Terminada"
    },
    {
      "activity_log_id": 102,
      "assistant_id": 5,
      "baby_id": 1,
      "comments": null,
      "assistant_name": "Samantha Porter",
      "baby_name": "Merritt",
      "start_time": "2018-03-17T11:30:00.000Z",
      "status": "En progreso"
    },
    {
      "activity_log_id": 103,
      "assistant_id": 5,
      "baby_id": 1,
      "comments": null,
      "assistant_name": "Samantha Porter",
      "baby_name": "Merritt",
      "start_time": "2018-03-17T11:30:00.000Z",
      "status": "En progreso"
    },
    {
      "activity_log_id": 104,
      "assistant_id": 5,
      "baby_id": 1,
      "comments": null,
      "assistant_name": "Samantha Porter",
      "baby_name": "Merritt",
      "start_time": "2018-03-17T17:30:00.000Z",
      "status": "En progreso"
    },
    {
      "activity_log_id": 105,
      "assistant_id": 5,
      "baby_id": 1,
      "comments": null,
      "assistant_name": "Samantha Porter",
      "baby_name": "Merritt",
      "start_time": "2018-03-17T17:30:00.000Z",
      "status": "En progreso"
    },
    {
      "activity_log_id": 106,
      "assistant_id": 5,
      "baby_id": 1,
      "comments": null,
      "assistant_name": "Samantha Porter",
      "baby_name": "Merritt",
      "start_time": "2018-03-17T17:30:00.000Z",
      "status": "En progreso"
    }
  ]
}
```

#### Crear activity logs

Metodo: **POST**

Endpoint: `api/v1/babies/<baby_id>/activity_logs`

In: 

```json
{
	"activity_log": {
		"baby_id": 1,
		"assistant_id": 5,
		"activity_id": 8,
		"start_time": "2018-03-17 11:30"
	}
}
```

Example:

```bash
curl --request POST \
  --url http://localhost:3000/api/v1/babies/2/activity_logs \
  --header 'content-type: application/json' \
  --data '{
  "{
	"activity_log": {
		"baby_id": 1,
		"assistant_id": 5,
		"activity_id": 8,
		"start_time": "2018-03-17 11:30"
	}
}' 
```

Response:

```json
{
  "activity_log": {
    "activity_log_id": 108,
    "assistant_id": 5,
    "baby_id": 1,
    "comments": null,
    "start_time": "2018-03-17T11:30:00-06:00",
    "status": "En progreso"
  }
}
```

Error response:

```json
# Status Code: 400 - Bad Request
{
  "errors": {
    "assistant": [
      "El asistente es requerido."
    ],
    "assistant_id": [
      "El asistente no puede ir en blanco."
    ]
  }
}
```

#### Actualizar activity log

Metodo: **PUT**

Endpoint: `api/v1/babies/<baby_id>/activity_logs/<activity_log_id>`

In: 

```json
{
	"activity_log": {
		"activity_id": 8,
		"stop_time": "2018-03-17 12:30",
		"comments": "todo chido"
	}
}
```
Example:

```bash
curl --request PUT \
  --url http://localhost:3000/api/v1/babies/2/activity_logs/105 \
  --header 'content-type: application/json' \
  --data '{
	"activity_log": {
		"activity_id": 8,
		"stop_time": "2018-03-17 12:30",
		"comments": "todo chido"
	}
}' 
```

Response:

```json
{
  "activity_log": {
    "activity_log_id": 101,
    "assistant_id": 5,
    "baby_id": 1,
    "comments": "todo chido",
    "start_time": "2018-03-17T11:30:00-06:00",
    "stop_time": "2018-03-17T12:30:00-06:00",
    "status": "Terminada"
  }
}
```

Error response:

```json
# Status Code: 400 - Bad Request
{
  "errors": {
    "activity_log_not_found": "No se encontro la actividad"
  }
}
```




### TO-DO

- Tests


