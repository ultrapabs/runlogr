Runlogr.Views.LogShow = Backbone.View.extend ({

  template: JST['log_show'],

  events: {
      "click .edit-log-button" : "editLog",
      "submit .log-form" : "saveChanges",
      "click .discard-changes" : "discardChanges",
  },

  initialize: function () {
    this.listenTo(this.model, 'sync add', this.render);
  },

  render: function () {
    var content = this.template({log: this.model, shoe_options: this.model.shoe_options()});
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
  }

});
