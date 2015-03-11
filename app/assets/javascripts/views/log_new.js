Runlogr.Views.LogNew = Backbone.View.extend ({

  events: {
    "submit .create-log": "createLog"
  },

  template: JST['log_new'],

  render: function () {
    var content = this.template();
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
        Backbone.history.navigate('', {trigger: true});
      },
      error: function () { console.log('log create error') }
    })

  }

});
