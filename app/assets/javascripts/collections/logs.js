Runlogr.Collections.Logs = Backbone.Collection.extend ({

  model: Runlogr.Models.Log,

  url: 'api/logs',

  comparator: function(log) {
    var time = new Date(log.escape('date')).getTime();
    return -time;
  },

  getOrFetch: function (id) {
    var log = this.get(id);
    var logs = this;

    if (!log) {
      log = new Runlogr.Models.Log({id: id});
      log.fetch( {
        success: function () { logs.add(log); }
      });
    } else {
      log.fetch();
    }

    return log;
  }

});
