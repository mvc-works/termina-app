
var
  Pipeline $ require :cumulo-pipeline

= exports.out $ new Pipeline

= exports.action $ \ (data)
  exports.out.send data
