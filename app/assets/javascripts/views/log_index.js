Runlogr.Views.LogIndex = Backbone.View.extend ({

  template: JST['log_index'],

  initialize: function () {
    this.listenTo(this.collection, 'sync add', this.render);
  },

  render: function() {
    var content = this.template({logs: this.collection});
    this.$el.html(content);

    return this;
  },

});
