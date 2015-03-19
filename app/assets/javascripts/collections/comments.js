Runlogr.Collections.Comments = Backbone.Collection.extend ({

  model: Runlogr.Models.Comment,

  url: 'api/comments',

  comparator: 'created_at',

  getOrFetch: function (id) {
    var comment = this.get(id);
    var comments = this;

    if (!comment) {
      comment = new Runlogr.Models.Comment({id: id});
      comment.fetch( {
        success: function () { comments.add(comment); }
      });
    } else {
      comment.fetch();
    }

    return comment;
  }
});
