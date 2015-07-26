
var
  Pipeline $ require :cumulo-pipeline
  Immutable $ require :immutable
  patch $ require :immutablepatch

= exports.in $ new Pipeline

var initial $ Immutable.Map

= exports.out $ exports.in.reduce initial $ \ (store action)
  var delta $ Immutable.fromJS action.data
  return $ patch store delta
