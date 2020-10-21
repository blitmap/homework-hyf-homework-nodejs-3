express = require 'express'

port = 3000
app  = express()

app.get '/', (_, res) ->
	res.send 'Hello World!'

app.get '/users', (_, res) ->
	res.send []

app.listen port, ->
	console.log "Example app listening at http://localhost:#{port}"
