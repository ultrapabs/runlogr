Runlogr.Views.UserSearch = Backbone.View.extend ({

  template: JST['user_search'],

  events: {
    "click .all-users" : "getAll",
    "submit .search-users" : "searchUsers"
  },

  initialize: function () {
    this.userResults = new Runlogr.Collections.UserSearchResults();
    this.allUsers = new Runlogr.Collections.Users();
    this.listenTo(this.userResults, "sync add", this.renderUserResults)
    this.listenTo(this.allUsers, "sync add", this.render)
  },

  render: function () {
    var content = this.template({users: this.allUsers});
    this.$el.html(content);
    return this;
  },

  renderUserResults: function () {
    var content = this.template({users: this.userResults});
    this.$el.html(content);

    return this;
  },

  searchUsers: function (event) {
    event.preventDefault();

    this.userResults._query = this.$(".query").val();
    this.userResults.fetch({
      data: {query: this.userResults._query}
    });

  },

  getAll: function () {
    this.allUsers.fetch();
  }

});
