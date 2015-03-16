Runlogr.Routers.RunlogrRouter = Backbone.Router.extend ({

  routes: {
    '' : 'runlogrHome',
    'blogs' : 'blogIndex',
    'blogs/new' : 'blogNew',
    'blogs/:id' : 'blogShow',
    'logs' : 'logIndex',
    'logs/new' : 'logNew',
    'logs/:id' : 'logShow',
    'shoes/new' : 'shoeNew',
    'users/:id' : 'userShow',
    'search' : 'userSearch'
  },

  initialize: function (rootEl) {
    this.$rootEl = rootEl;
    this.blogs = new Runlogr.Collections.Blogs();
    this.blogs.fetch();
    this.logs = new Runlogr.Collections.Logs();
    this.logs.fetch();
    this.users = new Runlogr.Collections.Users();
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
    var blogView = new Runlogr.Views.BlogNew({collection: this.blogs});
    this._swapView(blogView);
  },

  blogShow: function(id) {
    var blog = this.blogs.getOrFetch(id);
    var blogView = new Runlogr.Views.BlogShow({model: blog, collection: this.blogs});
    this._swapView(blogView);
  },

  logIndex: function() {
    var logView = new Runlogr.Views.LogIndex({collection: this.logs});
    this._swapView(logView);
  },

  logNew: function() {
    var logView = new Runlogr.Views.LogNew({collection: this.logs});
    this._swapView(logView);
  },

  logShow: function(id) {
    var log = this.logs.getOrFetch(id);
    var logView = new Runlogr.Views.LogShow({model: log, collection: this.logs});

    this._swapView(logView);
  },

  shoeNew: function() {
    var shoeView = new Runlogr.Views.ShoeNew({collection: this.shoes});
    this._swapView(shoeView);
  },

  userShow: function(id) {
    var user = this.users.getOrFetch(id);
    var userView = new Runlogr.Views.UserShow({model: user, collection: this.users});
    this._swapView(userView);
  },

  userSearch: function () {
    var userView = new Runlogr.Views.UserSearch({collection: this.users});
    this._swapView(userView);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
