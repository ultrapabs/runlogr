Runlogr.Routers.RunlogrRouter = Backbone.Router.extend ({

  routes: {
    '' : 'runlogrHome',
    'blogs' : 'blogIndex',
    'blogs/new' : 'blogNew',
    'blogs/:id' : 'blogShow',
    'logs' : 'logIndex',
    'logs/new' : 'logNew',
    'logs/:id' : 'logShow',
  },

  initialize: function (rootEl) {
    this.$rootEl = rootEl;
    this.blogs = new Runlogr.Collections.Blogs();
    this.blogs.fetch();
    this.logs = new Runlogr.Collections.Logs();
    this.logs.fetch();
  },

  runlogrHome: function () {
    var feedView = new Runlogr.Views.Feed({
                     blogs: this.blogs,
                     logs: this.logs
                   });

    this._swapView(feedView);
  },

  blogIndex: function() {
    var blogView = new Runlogr.Views.BlogIndex({collection: this.blogs});
    this._swapView(blogView);
  },

  blogNew: function() {
    var logView = new Runlogr.Views.LogNew({collection: this.blogs});
    this._swapView(blogView);
  },

  blogShow: function() {

  },

  logIndex: function() {
    var logView = new Runlogr.Views.LogIndex({collection: this.logs});
    this._swapView(logView);
  },

  logNew: function() {
    var logView = new Runlogr.Views.LogNew({collection: this.logs});
    this._swapView(logView);
  },

  logShow: function() {

  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
