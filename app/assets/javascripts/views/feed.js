Runlogr.Views.Feed = Backbone.View.extend ({

  template: JST['feed'],

  initialize: function (options) {
    this.blogs = options.blogs;
    this.logs = options.logs;

    this.listenTo(this.blogs, 'sync add', this.render);
    this.listenTo(this.logs, 'sync add', this.render);

  },

  render: function () {
    var content = this.template({blogs: this.blogs, logs: this.logs})
    this.$el.html(content);

    return this;
  },

});
