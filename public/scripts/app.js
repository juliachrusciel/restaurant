// food model
var Food = Backbone.Model.extend({
  initialize: function() {

  }
});
// food collection
var FoodCollection = Backbone.Collection.extend({
     model: Food,
     url: '/api/foods'
    },
     initialize: function() {

     }
  });
