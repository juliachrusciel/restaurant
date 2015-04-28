var app = app || {};

app.PartyCollection = Backbone.Collection.extend({
  url: '/api/parties'
});
