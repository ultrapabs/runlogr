Runlogr.Views.UserShow = Backbone.View.extend ({

  template: JST['user_show'],

  events: {
    "click .edit-profile-button" : "editProfile",
    "submit .edit-profile-form" : "saveChanges",
    "click .discard-changes" : "discardChanges",
  },

  initialize: function () {
    this.listenTo(this.model, "sync", this.render)
  },

  render: function () {

    var content = this.template({user: this.model,
      blogs: this.model.blogs(),
      logs: this.model.logs(),
      shoes: this.model.shoes(),
    });
    this.$el.html(content);
    return this;
  },

  editProfile: function (event) {
    event.preventDefault();

    this.$el.find('.edit-profile-form').removeClass('hidden');
    this.$el.find('.save-changes').removeClass('hidden');
    this.$el.find('.discard-changes').removeClass('hidden');
    this.$el.find('.edit-profile-button').addClass('hidden');
    this.$el.find('.view-user-profile').addClass('hidden');

  },

  saveChanges: function (event) {
    event.preventDefault();

    var userAttrs = $(event.currentTarget).serializeJSON().user;
    var that = this;
    var url = "#users/" + this.model.id;

    if (userAttrs.pw1.length > 0) {
      if (userAttrs.pw1 === userAttrs.pw2) {
        this.model.set(userAttrs);
        this.model.set({password: userAttrs.pw1});
      } else {
        alert('Passwords do not match.');
        return;
      }
    } else {
      this.model.set(userAttrs);
    }


    this.model.save({}, {
      success: function () {
        that.collection.add(that.model, { merge: true });
        Backbone.history.navigate(url, { trigger: true });
      },
      error: function () {
        console.log("user save error");
      }
    });
  },

  discardChanges: function (event) {
    event.preventDefault();
    this.render();
  }


});
