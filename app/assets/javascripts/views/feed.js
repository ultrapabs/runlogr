Runlogr.Views.Feed = Backbone.View.extend ({

  template: JST['feed'],

  initialize: function (options) {
    this.blogs = new Runlogr.Collections.Blogs();
    this.blogs.fetch();
    this.logs = new Runlogr.Collections.Logs();
    this.logs.fetch();

    this.listenTo(this.blogs, 'sync add', this.render);
    this.listenTo(this.logs, 'sync add', this.render);

  },

  render: function () {
    var content = this.template({blogs: this.blogs, logs: this.logs})
    this.$el.html(content);

    return this;
  },

});
