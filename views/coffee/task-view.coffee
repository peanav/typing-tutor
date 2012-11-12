define [
  'lib/backbone',
  'lib/mustache',
  'text!templates/task.mustache',
  'string-compare'
], (Backbone, Mustache, template, StringCompare) ->
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
          @.wrong(value, sentence) if value != @model.get('guess')
          @.model.set('guess', value)
        else
          @.correct()

    correct: ->
      @.model.set 'completed', true
      @.$el.addClass('bounceOutUp')

    wrong: (value, sentence)->
      @.$el.addClass('shake')
      window.setTimeout =>
        @.$el.removeClass 'shake'
      , 1500
      @.setMarks StringCompare.compare(value, sentence)

    setMarks: (indices)->
      errors = @.$('.errors').empty()
      errors.append _.reduce(indices, (memo, index) =>
        memo.push "<mark style='left:#{30+22*index}px'></mark>"
        memo
      , []).join ''

    focusAgain: (e) ->
      window.setTimeout =>
        @.$('input').trigger 'focus'
      , 200 if @.model.get('completed') == false
  }

