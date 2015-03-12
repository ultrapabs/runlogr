Runlogr.Routers.RunlogrRouter = Backbone.Router.extend ({

  routes: {
    '' : 'runlogrHome',
    'blogs' : 'blogIndex',
    'blogs/new' : 'blogNew',
    'blogs/:id' : 'blogShow',
    'logs' : 'logIndex',
    'logs/new' : 'logNew',
    'logs/:id' : 'logShow',
    'shoes' : 'shoeList',
    'shoes/new' : 'shoeNew'
  },

  initialize: function (rootEl) {
    this.$rootEl = rootEl;
    this.blogs = new Runlogr.Collections.Blogs();
    this.blogs.fetch();
    this.logs = new Runlogr.Collections.Logs();
    this.logs.fetch();
    this.shoes = new Runlogr.Collections.Shoes();
    this.shoes.fetch();
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
    var blogView = new Runlogr.Views.BlogShow({model: blog});
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
    var logView = new Runlogr.Views.LogShow({model: log});

    this._swapView(logView);
  },

  shoeList: function() {
    var shoeView = new Runlogr.Views.ShoeList({collection: this.shoes, logs: this.logs});
    this._swapView(shoeView);
  },

  shoeNew: function() {
    var shoeView = new Runlogr.Views.ShoeNew({collection: this.shoes});
    this._swapView(shoeView);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
