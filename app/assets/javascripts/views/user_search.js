Runlogr.Views.UserSearch = Backbone.View.extend ({

  template: JST['user_search'],

  initialize: function () {
    this.listenTo(this.collection, "sync add", this.render)
  },

  render: function () {
    var content = this.template({users: this.collection});
    this.$el.html(content);

    return this;
  }

});
