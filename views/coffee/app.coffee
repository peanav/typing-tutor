define ['lib/jquery', 'app-view', 'text-collection', 'text-model'], ($, AppView, Texts, Text) ->
  init = ->
    app = new AppView()
    app.render()
    app.collection.reset bootstrap()
    app.activateFirst()

  bootstrap = ->
    [
      { sentence: 'My phone number is 801-735-9515' }
      { sentence: 'I live in Orem Utah' }
      { sentence: 'My birthday is Feburary 4th' }
      { sentence: 'My adress is 189 South 70 West' }
      { sentence: 'I am a kindergartener' }
      { sentence: "My mom's name is Kelsey" }
      { sentence: "My dad's name is Paul" }
      { sentence: 'I have a brother named Crew' }
      { sentence: 'I have a brother named Miles' }
      { sentence: 'Jasmine is my favorite princess' }
    ]

  return {
    init: init
  }
