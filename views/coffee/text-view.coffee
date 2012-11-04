define [
  'lib/backbone',
  'lib/mustache',
  'text!templates/type-task.mustache'
], (Backbone, Mustache, template) ->
  Backbone.View.extend {
    className: 'type-task'

    events: {
      'keyup input': 'checkTyping'
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
      self = @
      @.model.set 'completed', true
      @.$el.addClass('bounceOutUp')

    wrong: ->
      self = @
      @.$el.addClass('shake')
      window.setTimeout ->
        self.$el.removeClass('shake')
      , 1500
  }

