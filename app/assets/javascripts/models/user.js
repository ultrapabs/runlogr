Runlogr.Models.User = Backbone.Model.extend ({

  urlRoot: 'api/users',

  blogs: function () {
    if (!this._blogs) {
      this._blogs = new Runlogr.Collections.Blogs([], {user: this});
    }

    return this._blogs;
  },

  logs: function () {
    if (!this._logs) {
      this._logs = new Runlogr.Collections.Logs([], {user: this});
    }

    return this._logs;
  },

  shoes: function () {
    if (!this._shoes) {
      this._shoes = new Runlogr.Collections.Shoes([], {user: this});
    }

    return this._shoes;
  },

  parse: function (response) {

    if (response.blogs) {
      this.blogs().set(response.blogs, {parse: true});
      delete response.blogs;
    }

    if (response.logs) {
      this.logs().set(response.logs, {parse: true});
      delete response.logs;
    }

    if (response.shoes) {
      this.shoes().set(response.shoes, {parse: true});
      delete response.shoes;
    }

    return response;
  },

  toJSON: function () {
    return { user: _.clone(this.attributes) };
  }

});
