Runlogr.Collections.Users = Backbone.Collection.extend ({

  model: Runlogr.Models.User,

  url: 'api/users',

  comparator: 'username',

  getOrFetch: function (id) {
    var user = this.get(id);
    var users = this;

    if (!user) {
      user = new Runlogr.Models.User({id: id});
      user.fetch( {
        success: function () { users.add(user) }
      });
    } else {
      user.fetch();
    }

    return user;
  }

});
