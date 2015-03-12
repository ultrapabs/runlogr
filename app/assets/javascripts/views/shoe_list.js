Runlogr.Views.ShoeList = Backbone.View.extend ({

  template: JST['shoe_list'],

  initialize: function () {
    this.listenTo(this.collection, 'sync add', this.render);
  },

  render: function () {
    var content = this.template({shoes: this.collection});
    this.$el.html(content);

    return this;
  }



});
