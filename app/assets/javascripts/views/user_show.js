Runlogr.Views.UserShow = Backbone.View.extend ({

  template: JST['user_show'],

  events: {
    'click .edit-profile-button' : 'editProfile',
    'submit .edit-profile-form' : 'saveChanges',
    'change .new-profile-pic' : 'updateProfilePic',
    'click .discard-changes' : 'discardChanges',
    'click .follow' : 'changeFollow',
    'click .remove-shoes' : 'showDeleteButtons',
    'click .done-editing' : 'hideDeleteButtons',
    'click .delete-shoe' : 'showConfirmCancel',
    'click .delete-shoe-cancel' : 'deleteCancel',
    'click .delete-shoe-confirm' : 'deleteConfirm'
  },

  initialize: function (options) {
    this.userShoes = options.userShoes;
    this.listenTo(this.model.shoes(), "sync remove add", this.render)
    this.listenTo(this.model, "sync", this.render)
  },

  render: function () {
    var content = this.template({user: this.model,
      blogs: this.model.blogs(),
      logs: this.model.logs(),
      shoes: this.model.shoes()
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
    this.$el.find('.user-feed-wrapper').addClass('hidden');

  },

  saveChanges: function (event) {
    event.preventDefault();
    this.$el.find('.edit-profile-form').addClass('hidden');
    this.$el.find('.save-changes').addClass('hidden');
    this.$el.find('.discard-changes').addClass('hidden');

    this.$el.find('.processing-changes').removeClass('hidden');
    var userAttrs = $(event.currentTarget).serializeJSON().user;
    // var that = this;
    // var url = "#users/" + this.model.id;

    if (userAttrs.pw1.length > 0) {
      if (userAttrs.pw1 === userAttrs.pw2) {
        this.model.set(userAttrs);
        this.model.set({password: userAttrs.pw1});
      } else {
        console.log("passwords do not match");
        return;
      }
    } else {
      this.model.set(userAttrs);
    }

    this.model.save({}, {
      success: function () {
        // Backbone.history.navigate(url, { trigger: true });
        window.location.reload();
      },
      error: function () {
        console.log("user save error");
      }
    });
  },

  updateProfilePic: function (event) {
    var profilePic = event.currentTarget.files[0];
    var fileReader = new FileReader();

    var that = this;
    fileReader.onloadend = function() {
      that.model.set("profile_pic", fileReader.result);
    };

    fileReader.readAsDataURL(profilePic);
  },

  discardChanges: function (event) {
    event.preventDefault();
    this.model.unset('profile_pic');
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
  },

  showDeleteButtons: function (event) {
    event.preventDefault();
    this.$el.find('.delete-shoe').removeClass('hidden');
    this.$el.find('.done-editing').removeClass('hidden');
    this.$el.find('.add-shoe').addClass('hidden');
    this.$el.find('.remove-shoes').addClass('hidden');
  },

  hideDeleteButtons: function (event) {
    event.preventDefault();
    this.$el.find('.delete-shoe').addClass('hidden');
    this.$el.find('.done-editing').addClass('hidden');
    this.$el.find('.add-shoe').removeClass('hidden');

    this.$el.find('.remove-shoes').removeClass('hidden');
    this.$el.find('.delete-shoe-cancel').addClass('hidden');
    this.$el.find('.delete-shoe-confirm').addClass('hidden');
    this.$el.find('.delete-shoe').addClass('hidden');
  },

  showConfirmCancel: function (event) {
    event.preventDefault();
    var shoeId = $(event.currentTarget).data('id');
    this.$el.find(".delete-shoe-cancel[data-id='" + shoeId + "']").removeClass('hidden');
    this.$el.find(".delete-shoe-confirm[data-id='" + shoeId + "']").removeClass('hidden');
    this.$el.find(".delete-shoe[data-id='" + shoeId + "']").addClass('hidden');
  },

  deleteCancel: function (event) {
    event.preventDefault();
    var shoeId = $(event.currentTarget).data('id');
    this.$el.find(".delete-shoe-cancel[data-id='" + shoeId + "']").addClass('hidden');
    this.$el.find(".delete-shoe-confirm[data-id='" + shoeId + "']").addClass('hidden');
    this.$el.find(".delete-shoe[data-id='" + shoeId + "']").removeClass('hidden');
  },

  deleteConfirm: function (event) {
    event.preventDefault();
    var shoeId = $(event.currentTarget).data('id');
    var shoe = this.model.shoes().get(shoeId);
    var userShoes = this.userShoes;
    shoe.destroy({
      success: function () { userShoes.remove(shoe); }
    });
  }

});
