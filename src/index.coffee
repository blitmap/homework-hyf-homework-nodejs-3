express = require 'express'

port = 3000
app  = express()

users = []

app.get '/', (_, res) ->
	res.send 'Hello World!'

app.get '/users', (_, res) ->
	res.send users

app.post '/user', (_, res) ->
	u = { id: users.length }

	users.push u
	res.send u

app.get '/user/:id', (req, res) ->
	res.send users[req.params.id]

ACCEPTED   = 202
NO_CONTENT = 204

app.delete '/user/:id', (req, res) ->
	n = req.params.id
	s = NO_CONTENT

	if users[n]?
		users.splice n
		s = ACCEPTED

	res.status(s).send()

app.listen port, ->
	console.log "Example app listening at http://localhost:#{port}"
