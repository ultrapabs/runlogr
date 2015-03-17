Runlogr.Views.UserSearch = Backbone.View.extend ({

  template: JST['user_search'],

  events: {
    "click .all-users" : "getAll",
    "click .search-users" : "searchUsers"
  },

  initialize: function () {
    this.userResults = new Runlogr.Collections.UserSearchResults();

    this.listenTo(this.userResults, "sync add", this.render)
  },

  render: function () {
    var content = this.template({users: this.userResults});
    this.$el.html(content);

    this.renderUserResults();

    return this;
  },

  renderUserResults: function () {
    var results = this.$(".search-results");
  },

  searchUsers: function (event) {
    event.preventDefault();

    this.userResults._query = this.$(".query").val();
    this.userResults.fetch({
      data: {query: this.userResults._query}
    });

  },

  getAll: function () {
    this.userResults = new Runlogr.Collections.Users();
    this.userResults.fetch();
  }

});
