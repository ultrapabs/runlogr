Runlogr.Collections.Shoes = Backbone.Collection.extend ({

  model: Runlogr.Models.Shoe,

  url: 'api/shoes',

  comparator: 'distance',

  getOrFetch: function (id) {
    var shoe = this.get(id);
    var shoes = this;

    if (!shoe) {
      shoe = new Runlogr.Models.Shoe({id: id});
      shoe.fetch( {
        success: function () { shoes.add(shoe) }
      });
    } else {
      shoe.fetch();
    }

    return shoe;
  }

});
