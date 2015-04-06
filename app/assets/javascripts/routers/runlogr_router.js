Runlogr.Routers.RunlogrRouter = Backbone.Router.extend ({

  routes: {
    'feed' : 'runlogrFeed',
    'blogs/new' : 'blogNew',
    'blogs/:id' : 'blogShow',
    'logs/new' : 'logNew',
    'logs/:id' : 'logShow',
    'shoes/new' : 'shoeNew',
    'users/:id' : 'userShow',
    'search' : 'userSearch'
  },

  initialize: function (rootEl) {
    this.$rootEl = rootEl;
    this.blogs = new Runlogr.Collections.Blogs();
    this.logs = new Runlogr.Collections.Logs();
    this.users = new Runlogr.Collections.Users();
    this.userShoes = new Runlogr.Collections.Shoes();
    this.userShoes.fetch();
  },

  runlogrFeed: function () {
    var feedView = new Runlogr.Views.Feed();
    this._swapView(feedView);
  },

  blogNew: function() {
    var blogView = new Runlogr.Views.BlogNew();
    this._swapView(blogView);
  },

  blogShow: function(id) {
    var blog = this.blogs.getOrFetch(id);
    var blogView = new Runlogr.Views.BlogShow({model: blog, collection: this.blogs});
    this._swapView(blogView);
  },

  logNew: function() {
    var logView = new Runlogr.Views.LogNew({shoes: this.userShoes});
    this._swapView(logView);
  },

  logShow: function(id) {
    var log = this.logs.getOrFetch(id);
    var logView = new Runlogr.Views.LogShow({model: log, collection: this.logs});

    this._swapView(logView);
  },

  shoeNew: function() {
    var shoeView = new Runlogr.Views.ShoeNew({collection: this.userShoes});
    this._swapView(shoeView);
  },

  userShow: function(id) {
    var user = this.users.getOrFetch(id);
    var userView = new Runlogr.Views.UserShow({
      model: user,
      userShoes: this.userShoes
    });
    this._swapView(userView);
  },

  userSearch: function () {
    var userView = new Runlogr.Views.UserSearch();
    this._swapView(userView);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
