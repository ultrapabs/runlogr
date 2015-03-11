window.Runlogr = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Runlogr.Routers.RunlogrRouter($('.main-content'));
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Runlogr.initialize();
});
