// // food model
// var Food = Backbone.Model.extend({
//   initialize: function() {
//
//   }
// });
// // food collection
// var FoodCollection = Backbone.Collection.extend({
//      model: Food,
//      url: '/api/foods'
//     },
//      initialize: function() {
//
//      }
//   });
//
//
//



// Document ready...

  // Create a new food collection
    // What model does it manage?
  app.foods = new app.FoodCollection({
    model: app.FoodModel
  });


  // Create a new party collection
    // What model does it manage?
  app.parties = new app.PartyCollection({
    model: app.PartyModel
  });


  // Create a new list view for foods
    // what collection will it use?
    // what modelView will it use?
    // what el should it use?
  var FoodView = Backbone.View.extend({
    tagName: "section",
    className: "order-section",
    template: _.template(),

    initialize: function(){
      this.render();
    },
    render: function() {
      var data = {
        id: "FoodButton",
        submitButton: "New Food Item",
      }
      this.$el.html(this.template(data));
    }
    submit: function() {

    }
  });

  // Create a new list view for parties
    // what collection will it use?
    // what modelView will it use?
    // what el should it use?


  // Ask the foods collection to fetch
  // Ask the parties collection to fetch
