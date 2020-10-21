express = require 'express'

port = 3000
app  = express()

app.get '/', (_, res) ->
	res.send 'Hello World!'

app.listen port, ->
	console.log "Example app listening at http://localhost:#{port}"
