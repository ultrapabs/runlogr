Runlogr.Routers.RunlogrRouter = Backbone.Router.extend ({

  routes: {
    '' : 'runlogrIndex',
    'blogs' : 'blogIndex',
    'blogs/new' : 'blogNew',
    'blogs/:id' : 'blogShow'
  },

  initialize: function (rootEl) {
    this.$rootEl = rootEl;
    this.blogs = new Runlogr.Collections.Blogs();
    this.blogs.fetch();
  },

  runlogrIndex: function () {
    var blogView = new Runlogr.Views.BlogIndex({collection: this.blogs});
  },

  blogIndex: function() {
    var blogView = new Runlogr.Views.BlogIndex({collection: this.blogs});
    this._swapView(blogView);
  },

  blogNew: function() {

  },

  blogShow: function() {

  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
