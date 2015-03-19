Runlogr.Models.Log = Backbone.Model.extend ({

  urlRoot: 'api/logs',

  shoe_options: function () {
    if (!this._shoe_options) {
      this._shoe_options = new Runlogr.Collections.Shoes([], {log: this});
    }

    return this._shoe_options;
  },

  comments: function () {
    if (!this._comments) {
      this._comments = new Runlogr.Collections.Comments([], {log: this});
    }

    return this._comments;
  },

  parse: function (response) {

    if (response.shoe_options) {
      this.shoe_options().set(response.shoe_options, {parse: true});
      delete response.shoe_options;
    }

    if (response.comments) {
      this.comments().set(response.comments, {parse: true});
      delete response.comments;
    }

    return response;
  }

});
