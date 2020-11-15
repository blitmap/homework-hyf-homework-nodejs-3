express = require 'express'

PORT            = 3000
HTTP_ACCEPTED   = 202
HTTP_NO_CONTENT = 204

app  = express()

# using app.locals as our 'data store'; reachable at req.app.locals
app.locals.users = []

# this could be extracted to a controllers/user.coffee file
controllers =
	heartbeat: (_, res) -> res.send 'Hello World!'

	getAll: (req, res) ->
		{ users } = req.app.locals

		res.send users

	getById: (req, res) ->
		{ id }    = req.params
		{ users } = req.app.locals

		res.send users[id]

	add: (req, res) ->
		{ users } = req.app.locals
		u         = { id: users.length }

		users.push u

		res.send u

	delete: (req, res) ->
		{ id }    = req.params
		{ users } = req.app.locals

		s = HTTP_NO_CONTENT

		if users[id]?
			s = HTTP_ACCEPTED
			users.splice id

		res.status(s).send()

# this could be extracted to a routes/user.coffee file
routes = express.Router()

routes.get    '/',         controllers.heartbeat
routes.get    '/users',    controllers.getAll
routes.post   '/user',     controllers.add
routes.get    '/user/:id', controllers.getById
routes.delete '/user/:id', controllers.delete

app.use routes

app.listen PORT, ->
	console.log "Example app listening at http://localhost:#{PORT}"
