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
Run server: 

```
rails s
```
#### Configuration

You can change the next enviroment variables:

```
export KINDERGATEN_APP_KEY=<yourappkey>
export KINDERGATEN_APP_DB=kinedu_development
export KINDERGATEN_APP_TEST=kinedu_test
export KINDERGATEN_APP_HOST=interfactura_app
export MYSQL_USER=<your_mysql_user>
export MYSQL_PASS=<your_pass>
```

#### Test suite

For execute test run:

```
rails test
```

## How to use

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
TO DO: format response
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
TO DO: format response 
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

- Format response on PUT and POST activity logs.
- Validate stop time in activity logs.
- Format dates on iso8601 and YYYY-MM-DD.


