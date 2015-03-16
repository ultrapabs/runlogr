Runlogr.Views.ShoeNew = Backbone.View.extend ({

  template: JST['shoe_new'],

  events: {
    "submit .new-shoe" : "createShoe"
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);

    return this;
  },

  createShoe: function (event) {
    event.preventDefault();

    var shoes = this.collection;
    var shoeAttrs = $(event.target).serializeJSON().shoe;
    var newShoe = new Runlogr.Models.Shoe(shoeAttrs);

    newShoe.save({}, {
      success: function () {
        var userHome = '#users/' + newShoe.escape('user_id');
        Backbone.history.navigate(userHome, {trigger: true});
      },
      error: function () { console.log('shoe create error'); }
    });
  }

});
