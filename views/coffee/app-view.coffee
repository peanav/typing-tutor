define [
  'lib/jquery',
  'lib/backbone',
  'lib/mustache',
  'text!templates/app.mustache',
  'task-collection',
  'task-view'
], ($, Backbone, Mustache, template, TaskCollection, TaskView) ->
  Backbone.View.extend {
    el: $('#app')

    events: {
      'click button': 'readAgain'
    }

    initialize: ->
      @.collection = new TaskCollection()
      @.collection.bind 'reset', this.renderTasks, this
      @.collection.bind 'change', this.taskChanged, this
      @.collection.bind 'remove', this.taskRemoved, this

    render: ->
      @.$el.append Mustache.render template
      @

    renderTasks: ->
      @.total = @.collection.length
      @.collection.each (task) ->
        view = new TaskView model: task
        @.$('#tasks').append view.render().el
      , this
      $('.total-tasks').text @.collection.length

    activateFirst: ->
      ele = @.$('.task:not(.active):first')
      if ele[0]
        ele.addClass('active bounceInUp').find('input')
        window.setTimeout =>
          ele.find('input')[0].focus()
          ele.removeClass('bounceInUp')
          @.$('#read').show().addClass 'show'
        ,1000
        @.textToSpeech ele.find('div').text()

    textToSpeech: (text) ->
      @.currentText = text if text
      audio = document.createElement('audio')
      audio.setAttribute('src', "/voice?q=#{escape @.currentText}")
      audio.load()
      audio.play()

    readAgain: ->
      @.textToSpeech()


    taskChanged: (task) ->
      if task.get('completed')
        @.$('#read').hide().removeClass 'show'
        @.collection.shift()
        @.activateFirst()
        @.$('#tasks').css('margin-top', '-=235px')

    taskRemoved: ->
      $('.current-task').text(@.total - @.collection.length + 1) if @.collection.length

  }
