Runlogr.Views.BlogNew = Backbone.View.extend ({

  events: {
    "submit .blog-form": "createBlog"
  },

  template: JST['blog_new'],

  render: function () {
    var content = this.template();
    this.$el.html(content);

    return this;
  },

  createBlog: function (event) {
    event.preventDefault();

    var blogAttrs = $(event.target).serializeJSON().blog;
    var newBlog = new Runlogr.Models.Blog(blogAttrs);

    newBlog.save({}, {
      success: function () {
        var userHome = '#users/' + newBlog.escape('author_id');
        Backbone.history.navigate(userHome, {trigger: true});
      },
      error: function () { console.log('blog create error') }
    })

  }

});
