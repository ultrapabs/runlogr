Runlogr.Views.UserShow = Backbone.View.extend ({

  template: JST['user_show'],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render)
  },

  render: function () {

    var content = this.template({user: this.model,
      blogs: this.model.blogs(),
      logs: this.model.logs(),
      shoes: this.model.shoes(),
      miles: this.calcTotalMiles()
    });
    this.$el.html(content);

    return this;
  },

  calcTotalMiles: function () {
    var total = 0;
    this.model.logs().each (function (log) {
      total += log.attributes.distance;
    });

    return total;
  }

});
