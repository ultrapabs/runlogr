Runlogr.Views.UserShow = Backbone.View.extend ({

  template: JST['user_show'],

  events: {
    "click .edit-profile-button" : "editProfile",
    "submit .edit-profile-form" : "saveChanges",
    "click .discard-changes" : "discardChanges",
    "click .follow" : "changeFollow"
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

    if (this.model.get('followed_by_current_user')) {
      this.$el.find('.follow').html('Unfollow');
    } else {
      this.$el.find('.follow').html('Follow');
    }

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
  },

  changeFollow: function (event) {
    event.preventDefault();
    var userUrl = 'users/' + this.model.id;
    var postUrl = 'api/follows/';
    var deleteUrl = postUrl + this.model.get('follow_id');
    var that = this;

    if (this.model.get('followed_by_current_user')) {
      this.$el.find('.follow').addClass('hidden');

      $.ajax({ url: deleteUrl,
        type: 'DELETE',
        success: function(data) {
          that.model.set({ followed_by_current_user: false });
          that.$el.find('.follow').removeClass('hidden');
          that.render();
          },
        error: function () { console.log("unfollow error") }
      });
    } else {
      this.$el.find('.follow').addClass('hidden');

      $.ajax({ url: 'api/follows',
        type: 'POST',
        data: { leader_id: this.model.id },
        dataType: "json",
        success: function(data) {
          that.model.set({follow_id: data.id,
            followed_by_current_user: true
          });
          that.$el.find('.follow').removeClass('hidden');
          that.render();
        },
        error: function () { console.log("follow error") }
      });
    }

  }


});
