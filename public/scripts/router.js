define([
  'lib/jquery',
  'lib/backbone',
  'views/katalus-view'
],
function($, Backbone, View) {
  var AppRouter = Backbone.Router.extend({
    routes: {
      '': 'index'
    },

    index: function() {
      var view = new View();
      $('#container').append( view.render().el );
    }
  });

  return {
    start: function() {
      new AppRouter();
      Backbone.history.start();
    }
  }
});
