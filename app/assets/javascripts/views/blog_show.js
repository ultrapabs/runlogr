Runlogr.Views.BlogShow = Backbone.View.extend ({

  template: JST['blog_show'],

  events: {
    "click .edit-blog-button" : "editBlog",
    "click .delete-blog-button" : "deleteBlog",
    "click .cancel-delete-blog-button" : "deleteBlogCancel",
    "click .confirm-delete-blog-button" : "deleteBlogConfirm",
    "submit .blog-form" : "saveChanges",
    "click .discard-blog-changes" : "discardChanges",
    "click .add-new-comment" : "addComment",
    "click .discard-comment" : "discardComment",
    "submit .add-comment" : "saveComment"
  },

  initialize: function () {
    this.listenTo(this.model, 'sync add', this.render);
    this.listenTo(this.model.comments(), 'sync remove add', this.render);
  },

  render: function () {

    var content = this.template({
      blog: this.model,
      comments: this.model.comments()
    });
    this.$el.html(content);

    return this;
  },

  editBlog: function (event) {
    event.preventDefault();

    this.$el.find('.blog-edit').removeClass('hidden');
    this.$el.find('.save-changes').removeClass('hidden');
    this.$el.find('.discard-blog-changes').removeClass('hidden');
    this.$el.find('.delete-blog-button').removeClass('hidden');
    this.$el.find('.edit-blog-button').addClass('hidden');
    this.$el.find('.blog-show').addClass('hidden');
    this.$el.find('.comments-wrapper').addClass('hidden');
  },

  saveChanges: function (event) {
    event.preventDefault();
    var that = this;
    var blogAttrs = $(event.currentTarget).serializeJSON().blog;
    var url = "#blogs/" + this.model.id;
    this.model.set(blogAttrs);

    this.model.save({}, {
      success: function () {
        that.collection.add(that.model, { merge: true });
        Backbone.history.navigate(url, { trigger: true });
      },
      error: function () {
        console.log("blog save error");
      }
    });
  },

  discardChanges: function (event) {
    event.preventDefault();
    this.render();
  },

  addComment: function (event) {
    event.preventDefault();
    this.$el.find('.add-new-comment').addClass('hidden');
    this.$el.find('.add-comment').removeClass('hidden');
    this.$el.find('.discard-comment').removeClass('hidden');
  },

  discardComment: function (event) {
    event.preventDefault();
    this.render();
  },

  saveComment: function (event) {
    event.preventDefault();

    var commentBody = $(event.target).serializeJSON().comment;
    var newComment = new Runlogr.Models.Comment(commentBody);
    newComment.set('commentable_type', 'Blog');
    newComment.set('commentable_id', this.model.id);
    var url = '#blogs/' + this.model.id;
    var blogComments = this.model.comments();

    newComment.save({}, {
      success: function () {
        blogComments.add(newComment, { merge: true });
        Backbone.history.navigate(url, {trigger: true});
      },
      error: function () { console.log('comment save error'); }
    })
  },

  deleteBlog: function () {
    event.preventDefault();

    this.$el.find('.cancel-delete-blog-button').removeClass('hidden');
    this.$el.find('.confirm-delete-blog-button').removeClass('hidden');
    this.$el.find('.delete-blog-button').addClass('hidden');
    this.$el.find('.discard-blog-changes').addClass('hidden');
  },

  deleteBlogCancel: function () {
    event.preventDefault();

    this.$el.find('.cancel-delete-blog-button').addClass('hidden');
    this.$el.find('.confirm-delete-blog-button').addClass('hidden');
    this.$el.find('.delete-blog-button').removeClass('hidden');
    this.$el.find('.discard-blog-changes').removeClass('hidden');
  },

  deleteBlogConfirm: function () {
    event.preventDefault();
    url = '#users/' + this.model.get('author_id')
    this.model.destroy({
      success: function () { Backbone.history.navigate(url, {trigger: true}) }
    });
  }

});
