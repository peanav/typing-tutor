define ['lib/backbone', 'text-model'], (Backbone, Text) ->
  Backbone.Collection.extend {
    model: Text
  }
