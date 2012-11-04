define ['lib/backbone', 'task-model'], (Backbone, Task) ->
  Backbone.Collection.extend {
    model: Task
  }
