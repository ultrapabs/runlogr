Runlogr.Views.LogShow = Backbone.View.extend ({

  template: JST['log_show'],

  events: {
      "click .edit-log-button" : "editLog",
      "submit .log-form" : "saveChanges",
      "click .discard-changes" : "discardChanges",
      "click .add-new-comment" : "addComment",
      "click .discard-comment" : "discardComment",
      "submit .add-comment" : "saveComment"
  },

  initialize: function () {
    this.listenTo(this.model, 'sync change', this.render);
    this.listenTo(this.model.comments(), 'sync remove add', this.render);
  },

  render: function () {
    var content = this.template({
      log: this.model,
      shoe_options: this.model.shoe_options(),
      comments: this.model.comments()
    });
    this.$el.html(content);

    return this;
  },

  editLog: function (event) {
    event.preventDefault();

    this.$el.find('.log-edit').removeClass('hidden');
    this.$el.find('.save-changes').removeClass('hidden');
    this.$el.find('.discard-changes').removeClass('hidden');
    this.$el.find('.edit-log-button').addClass('hidden');
    this.$el.find('.log-show').addClass('hidden');
  },

  saveChanges: function (event) {
    event.preventDefault();
    var that = this;
    var logAttrs = $(event.currentTarget).serializeJSON().log;
    var newDuration = logAttrs.hours * 3600 + logAttrs.minutes * 60 + logAttrs.seconds * 1

    var url = "#logs/" + this.model.id;
    this.model.set(logAttrs);
    this.model.set({duration: newDuration});

    this.model.save({}, {
      success: function () {
        that.collection.add(that.model, { merge: true });
        Backbone.history.navigate(url, { trigger: true });
      },
      error: function () {
        console.log("log save error");
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
    newComment.set('commentable_type', 'Log');
    newComment.set('commentable_id', this.model.id);
    var url = '#logs/' + this.model.id;
    var logComments = this.model.comments();

    newComment.save({}, {
      success: function () {
        logComments.add(newComment, { merge: true });
        Backbone.history.navigate(url, {trigger: true});
      },
      error: function () { console.log('comment save error'); }
    })
  }

});
