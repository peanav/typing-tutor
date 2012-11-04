define ['lib/jquery', 'app-view', 'text-collection', 'text-model'], ($, AppView, Texts, Text) ->
  init = ->
    app = new AppView()
    app.render()
    app.collection.reset bootstrap()
    app.activateFirst()

  bootstrap = ->
    [
      { sentence: 'Kelsey, you are so freaking hot!' }
      { sentence: 'I am a kindergartener' }
      { sentence: "My mom's name is Kelsey" }
      { sentence: "My dad's name is Paul" }
      { sentence: 'I have a brother named Crew' }
      { sentence: 'Jasmine is my favorite princess' }
    ]

  return {
    init: init
  }
