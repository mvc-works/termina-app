
var
  React $ require :react
  Immutable $ require :immutable

var
  Directory $ React.createFactory $ require :./directory
  Draft $ React.createFactory $ require :./draft
  Command $ React.createFactory $ require :./command
  Monitor $ React.createFactory $ require :./monitor
  History $ React.createFactory $ require :./history
  div $ React.createFactory :div

= module.exports $ React.createClass $ {}
  :propTypes $ {}
    :store $ React.PropTypes.instanceOf Immutable.Map

  :render $ \ ()
    var store this.props.store

    var activeProcs $ ... store
      get :procs
      filter $ \ (proc) (proc.get :alive)
    var inactiveProcs $ ... store
      get :procs
      filter $ \ (proc) (not (proc.get :alive))
      sortBy $ \ (proc)
        var start $ new Date $ proc.get :start-time
        - 0 (start.valueOf)

    div ({} (:className :app-layout))
      div ({} (:className :app-header))
        Directory $ {} (:store store)
        Draft
        Command $ {} (:store store)
      div ({} (:className :app-body))
        div ({} (:className :active-group))
          ... activeProcs (toArray)
            map $ \ (proc)
              Monitor $ {} (:proc proc) (:key (proc.get :pid))
        div ({} (:className :inactive-group))
          ... inactiveProcs (toArray)
            map $ \ (proc)
              History $ {} (:proc proc) (:key (proc.get :pid))
