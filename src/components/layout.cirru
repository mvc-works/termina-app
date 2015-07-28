
var
  React $ require :react
  Immutable $ require :immutable
  view $ require :../view

var
  Directory $ React.createFactory $ require :./directory
  Draft $ React.createFactory $ require :./draft
  Command $ React.createFactory $ require :./command
  Monitor $ React.createFactory $ require :./monitor
  div $ React.createFactory :div

= module.exports $ React.createClass $ {}
  :propTypes $ {}
    :store $ React.PropTypes.instanceOf Immutable.Map

  :onClearClick $ \ (event)
    view.action $ {}
      :type :clear

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
        Directory $ {}
          :options (store.get :directories)
          :defaultDir $ store.get :cwd
        Command $ {} (:options (store.get :commands))
      div ({} (:className :app-body))
        div ({} (:className :active-group))
          ... activeProcs (toArray)
            map $ \ (proc)
              Monitor $ {} (:proc proc) (:key (proc.get :pid))
        div ({} (:className :inactive-group))
          div ({} (:className :board))
            div ({} (:className :space))
            div ({} (:className :clear) (:onClick this.onClearClick))
          ... inactiveProcs (toArray)
            map $ \ (proc)
              Monitor $ {} (:proc proc) (:key (proc.get :pid))
