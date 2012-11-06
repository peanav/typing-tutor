define ['events', 'app-view', 'nyan-view'], (events, AppView, NyanView) ->
  init = ->
    app = new AppView()
    app.render()
    app.collection.reset bootstrap()
    app.activateFirst()

    events.on 'tasks:finished', nyanCat

  bootstrap = ->
    return sentence_tasks

  nyanCat = ->
    nyan = new NyanView()
    nyan.render()


  return {
    init: init
  }
