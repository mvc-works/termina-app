
var
  Pipeline $ require :cumulo-pipeline

= exports.in $ new Pipeline
= exports.out $ new Pipeline

= exports.setup $ \ (options)
  var ws $ new WebSocket $ + ":ws://localhost:" options.port

  = ws.onmessage $ \ (event)
    var data $ JSON.parse event.data
    exports.out.send data

  exports.in.for $ \ (behavior)
    ws.send $ JSON.stringify behavior
