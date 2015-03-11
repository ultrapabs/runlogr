Runlogr.Views.BlogNew = Backbone.View.extend ({

  events: {
    "submit .create-blog": "createBlog"
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
    var blogs = this.collection;

    newBlog.save({}, {
      success: function () {
        blogs.add(newBlog);
        Backbone.history.navigate('', {trigger: true});
      },
      error: function () { console.log('blog create error') }
    })

  }

});
