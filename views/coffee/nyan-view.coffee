define [
  'lib/jquery'
  'lib/backbone'
  'text!templates/nyan-cat.mustache'
], ($, Backbone, template) ->
  Backbone.View.extend {
    el: $ '#app'

    render: ->
      @.$el.append template
      $('header').empty()
      audio = document.createElement('audio')
      audio.setAttribute('src', "/music/gb.mp3")
      audio.load()
      audio.play()
      @
  }
