logger = new (require "../utils/logger")(name: 'Database')
mysql = require "mysql"
config = require "config"
genericPool = require "generic-pool"

###
Package: https://github.com/coopernurse/node-pool
Documentation: http://nodejsdb.org/2011/05/connection-pooling-node-db-with-generic-pool/
###

module.exports = Pool = genericPool.Pool(
  name: 'mysql'
  max: 10
  idleTimeoutMillis: 30000

  create: (callback) ->
    Connection = new mysql.createConnection(config.database)
    Connection.connect()

    callback Connection

  destroy: (client) ->
    client.end()
)
