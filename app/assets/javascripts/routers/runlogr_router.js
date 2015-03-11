Runlogr.Routers.RunlogrRouter = Backbone.Router.extend ({

  routes: {
    '' : 'runlogrHome',
    'blogs' : 'blogIndex',
    'blogs/new' : 'blogNew',
    'blogs/:id' : 'blogShow'
  },

  initialize: function (rootEl) {
    this.$rootEl = rootEl;
    this.blogs = new Runlogr.Collections.Blogs();
    this.blogs.fetch();
  },

  runlogrHome: function () {
    var blogView = new Runlogr.Views.BlogIndex({collection: this.blogs});

    this._swapView(blogView);
  },

  blogIndex: function() {
    var blogView = new Runlogr.Views.BlogIndex({collection: this.blogs});
    this._swapView(blogView);
  },

  blogNew: function() {
    var blogView = new Runlogr.Views.BlogNew({collection: this.blogs});
    this._swapView(blogView);
  },

  blogShow: function() {

  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
