var app = app || {};

app.ReceiptView = Backbone.View.extend({
  // first off - you will instantiate me when clicking on that submit button
  initialize: function(){
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model, 'delete', this.render);
  },
  events: {
      "click .select-bill": "render"
  },
  template: _.template( $('#receipt-template').html() ),
  tagName: 'li',
  className: 'receipt',
  render: function(){
    this.$el.append( this.template( this.model.attributes ) );
    $('#receipt-container').html(this.$el.html());
    return this;
  },


});
