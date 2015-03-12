Runlogr.Views.LogShow = Backbone.View.extend ({

  template: JST['log_show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var content = this.template({log: this.model});
    this.$el.html(content);

    return this;
  }

});
