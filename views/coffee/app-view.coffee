define [
  'lib/jquery',
  'lib/backbone',
  'lib/mustache',
  'text!templates/app.mustache',
  'text-collection',
  'text-view'
], ($, Backbone, Mustache, template, TextCollection, TextView) ->
  Backbone.View.extend {
    el: $('#app')
    initialize: ->
      @.collection = new TextCollection()
      @.collection.bind 'reset', this.renderTasks, this
      @.collection.bind 'change', this.taskChanged, this

    render: ->
      @.$el.append Mustache.render template
      @.$('#tasks').css('padding-top', ($(window).height() / 2) - 193)
      @

    renderTasks: ->
      @.collection.each (task) ->
        view = new TextView model: task
        @.$('#tasks').append view.render().el
      , this

    activateFirst: ->
      ele = @.$('.type-task:not(.active):first')
      if ele[0]
        ele.addClass('active bounceInUp').find('input')
        window.setTimeout ->
          ele.find('input')[0].focus()
          ele.removeClass('bounceInUp')
        ,1000
        @.textToSpeech ele.find('div').text()

    textToSpeech: (text) ->
      audio = document.createElement('audio')
      audio.setAttribute('src', "/voice?q=#{escape text}")
      audio.load()
      audio.play()

    taskChanged: (task) ->
      if task.get('completed')
        @.collection.shift()
        @.activateFirst()
        @.$('#tasks').css('margin-top', '-=235px')
  }
