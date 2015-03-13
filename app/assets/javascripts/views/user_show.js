Runlogr.Views.UserShow = Backbone.View.extend ({

  template: JST['user_show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    debugger;
    var content = this.template({user: this.model,
      blogs: this.model._blogs,
      logs: this.model._logs,
      shoes: this.model._shoes
    });
    this.$el.html(content);

    return this;
  }

});
