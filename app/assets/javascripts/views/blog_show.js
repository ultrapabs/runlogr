Runlogr.Views.BlogShow = Backbone.View.extend ({

  template: JST['blog_show'],

  events: {
    "click .edit-blog-button" : "editBlog",
    "submit .blog-form" : "saveChanges",
    "click .discard-changes" : "discardChanges",
  },

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template({blog: this.model});
    this.$el.html(content);

    return this;
  },

  editBlog: function (event) {
    event.preventDefault();

    this.$el.find('.blog-edit').removeClass('hidden');
    this.$el.find('.save-changes').removeClass('hidden');
    this.$el.find('.discard-changes').removeClass('hidden');
    this.$el.find('.edit-blog-button').addClass('hidden');
    this.$el.find('.blog-show').addClass('hidden');
  },

  saveChanges: function (event) {
    event.preventDefault();

  },

  discardChanges: function (event) {
    event.preventDefault();
    this.render();
  }

});
