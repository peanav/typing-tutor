define [
  'lib/backbone',
  'lib/mustache',
  'text!templates/task.mustache'
], (Backbone, Mustache, template) ->
  Backbone.View.extend {
    className: 'task'

    events: {
      'keyup input': 'checkTyping'
      'blur input': 'focusAgain'
    }

    render: ->
      @.$el.append Mustache.render(template, @.model.toJSON())
      @

    checkTyping: ->
      value = @.$('input').val()
      sentence = @.model.get('sentence')
      if value.length == sentence.length
        if value != sentence
          @.wrong() if value != @model.get('guess')
          @.model.set('guess', value)
        else
          @.correct()

    correct: ->
      @.model.set 'completed', true
      @.$el.addClass('bounceOutUp')

    wrong: ->
      @.$el.addClass('shake')
      window.setTimeout =>
        @.$el.removeClass 'shake'
      , 1500

    focusAgain: (e) ->
      window.setTimeout =>
        @.$('input').trigger 'focus'
      , 200
  }

