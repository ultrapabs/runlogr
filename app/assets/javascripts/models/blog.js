Runlogr.Models.Blog = Backbone.Model.extend ({

  urlRoot: 'api/blogs',

  comments: function () {
    if (!this._comments) {
      this._comments = new Runlogr.Collections.Comments([], {blog: this});
    }

    return this._comments;
  },

  parse: function (response) {

    if (response.comments) {
      this.comments().set(response.comments, {parse: true});
      delete response.comments;
    }

    return response;
  }

});
