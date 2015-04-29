var app = app || {};

app.PartyView = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model,'change', this.render);
    this.listenTo(this.model,'delete', this.remove);
  },
  template: _.template( $('#party-template').html() ),
  tagName: 'li',
  className: 'party',
  render: function(){
    this.$el.append( this.template( this.model.attributes ) );
    this.renderFoodList();
    return this;
  },
  renderFoodList: function(){
    var id = this.model.get('id'); // party id - get from server with ajax or model.fetch?
    console.log('render food list...');
    console.log(this.model.attributes);
    if (this.model.attributes.foods) {
      var foods = this.model.get('foods')
      var foodList = $('<ul>');
      for (var i = 0; i < foods.length; i++) {
        foodList.append( $('<li>').text( foods[i]['name'] ) );
      }
      this.$el.append(foodList);
    }

  },
  events:{
    'click .select-party': 'selectParty'
  },
  selectParty: function(){
    $('.party-selected').removeClass('party-selected');
    this.$el.addClass('party-selected');
    app.partySelection = this.model;
  }
});
