Runlogr.Views.BlogNew = Backbone.View.extend ({

  events: {
    "submit .blog-form": "createBlog",
    "click .blog-help": "showMarkdown",
    "click .help-done": "hideMarkdown",
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
    var that = this;

    newBlog.save({}, {
      success: function () {
        var userHome = '#users/' + newBlog.escape('author_id');
        Backbone.history.navigate(userHome, {trigger: true});
      },
      error: function () { console.log("blog create error") }
    })

  },

  showMarkdown: function () {
    this.$el.find('.blog-form').addClass('hidden');
    this.$el.find('.blog-help').addClass('hidden');
    this.$el.find('.markdown-example').removeClass('hidden');
    this.$el.find('.help-done').removeClass('hidden');
  },

  hideMarkdown: function () {
    this.$el.find('.markdown-example').addClass('hidden');
    this.$el.find('.help-done').addClass('hidden');
    this.$el.find('.blog-form').removeClass('hidden');
    this.$el.find('.blog-help').removeClass('hidden');
  }

});
