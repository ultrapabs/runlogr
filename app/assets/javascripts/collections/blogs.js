Runlogr.Collections.Blogs = Backbone.Collection.extend ({

  model: Runlogr.Models.Blog,

  comparator: function(blog) {
    var time = new Date(blog.escape('created_at')).getTime();
    return -time;
  },

  url: 'api/blogs',

  getOrFetch: function (id) {
    var blog = this.get(id);
    var blogs = this;

    if (!blog) {
      blog = new Runlogr.Models.Blog({id: id});
      post.fetch( {
        success: function () { blogs.add(blog) }
      });
    } else {
      blog.fetch();
    }

    return blog;
  }

});
