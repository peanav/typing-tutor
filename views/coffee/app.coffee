define ['lib/jquery', 'app-view'], ($, AppView) ->
  init = ->
    app = new AppView()
    app.render()
    app.collection.reset bootstrap()
    app.activateFirst()

  bootstrap = ->
    return sentence_tasks

  return {
    init: init
  }
