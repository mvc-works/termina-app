
var
  Pipeline $ require :cumulo-pipeline
  Immutable $ require :immutable
  patch $ require :immutablepatch

= exports.in $ new Pipeline

var initial $ Immutable.Map

= exports.out $ exports.in.reduce initial $ \ (store diff)
  var delta $ Immutable.fromJS diff
  return $ patch store delta
