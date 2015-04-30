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
$(document).ready(function(){

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
  app.foodListPainter = new app.GeneralListView({
    collection: app.foods,
    modelView: app.FoodView,
    el: $('#menu-list')
  });

  app.foods.fetch();

  app.partyListPainter = new app.GeneralListView({
    collection: app.parties,
    modelView: app.PartyView,
    el: $('#party-list')
  });

  app.parties.fetch();

  $("#receipt-button").on('click', function(evt) {
    // instantiate and render

    // receiptmodel + receipt view

    app.activePartyReceiptView = new app.PartyReceiptView({
      model: app.partySelection,
      el: $('#receipt-container')
    });

    app.activePartyReceiptView.render();



    // kinda like dis:
    // app.activeReceiptModel = new...
    // app.activeReceiptView = new .. ({ model: app.activeReceiptModel })
  });

  $('#bill-button').on('click', function(){

    var partyId = app.partySelection.attributes.id;
    // parties list
    var foodId = app.foodSelection.attributes.id;

    console.log("did we make it here yet?")

    $.ajax({
      method: 'post',
      url: '/api/orders',
      data: {order: { party_id: partyId, food_id: foodId }},
      success: function() {
        console.log("we are winners")
        app.parties.fetch( {reset: true} );

        $('.food-selected').removeClass('food-selected');
        $('.party-selected').removeClass('.party-selected');
        // receiptView init and the render call should go here
        //app.myReceiptModel = new app.ReceiptModel();
        //app.myReceiptView = new app.ReceiptView({ model: app.myReceiptModel });

        // put the $el inside of your receipt container here
      }
    });

      // $('#receipt-button').on('click', function())

    // $.ajax({
    //   method: 'post',
    //   url: 'api/orders',
    //   data: {order: {party_id: partyId, food_id: foodId }},
    //   success: function() {
    //     console.log("Show me the money!")
    //     app.parties.fetch( {reset: true} );
    //
    //     $('.receipt-selected').removeClass('receipt-selected');
    //   }
    // });

  });
});
  // app.FoodViewTemplate = $('#test-template').html();
  // app.FoodView = Backbone.View.extend({
  //   tagName: "section",
  //   className: "order-section",
  //   template: _.template(app.FoodViewTemplate),
  //   events: {
  //     "create a food" : "submit"
  //   },
  //   initialize: function(){
  //     this.render();
  //   },
  //   render: function() {
  //     var data = {
  //       id: "FoodButton",
  //       submitButton: "Add Food Item",
  //     }
  //     this.$el.html(this.template(data));
  //   }
  //   submit: function() {
  //     console.log("A new food item was added.")
  //     app.foods.create({
  //       name: "kale chip salted caramel soy milk latte",
  //       price: 42,
  //       cuisine: "hipster food",
  //     });
  //   }
  // });

  // Create a new list view for parties
    // what collection will it use?
    // what modelView will it use?
    // what el should it use?
    // var PartyView = Backbone.View.extend({
    //   tagName: "section",
    //   className: "party-section",
    //   template: _.template(),
    //
    //   initialize: function(){
    //     this.render();
    //   },
    //   render: function() {
    //     var data = {
    //       id: "PartyButton",
    //       submitButton: "Add Party",
    //     }
    //     this.$el.html(this.template(data));
    //   }
    //   submit: function() {
    //     console.log("A new party was added.")
    //   }
    // });

  // Ask the foods collection to fetch

  // Ask the parties collection to fetch
