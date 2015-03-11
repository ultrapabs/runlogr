Runlogr.Views.BlogIndex = Backbone.View.extend ({

  template: JST['blog_index'],

  initialize: function () {
    this.listenTo(this.collection, 'sync add', this.render);
  },

  render: function() {
    var content = this.template({blogs: this.collection});
    this.$el.html(content);

    return this;
  }

})
