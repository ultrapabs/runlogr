Runlogr.Views.LogNew = Backbone.View.extend ({

  events: {
    "submit .log-form": "createLog"
  },

  template: JST['log_new'],

  initialize: function(options) {
    this.shoes = options.shoes;
    this.listenTo(this.shoes, "sync", this.render)
  },

  render: function () {
    var content = this.template({shoes: this.shoes});
    this.$el.html(content);

    return this;
  },

  createLog: function (event) {
    event.preventDefault();

    var durationAttrs = $(event.target).serializeJSON().duration;
    var duration = ((durationAttrs.hours * 3600) +
                    (durationAttrs.minutes * 60) +
                    (durationAttrs.seconds * 1 ));

    var logAttrs = $(event.target).serializeJSON().log;
    var newLog = new Runlogr.Models.Log(logAttrs);
    newLog.set({duration: duration});

    var logs = this.collection;

    newLog.save({}, {
      success: function () {
        logs.add(newLog);
        var userHome = '#users/' + newLog.escape('user_id');
        Backbone.history.navigate(userHome, {trigger: true});
      },
      error: function () { console.log('log create error') }
    })

  }

});
