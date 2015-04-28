var app = app || {};

app.FoodCollection = Backbone.Collection.extend({
  url: '/api/foods'
});
