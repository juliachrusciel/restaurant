var app = app || {};

app.GeneralListView = Backbone.View.extend({
  initialize: function(options){
    this.modelView = options.modelView;
    this.listenTo(this.collection,'sync', this.render);
  },
  render: function(){
    this.$el.empty();
    var models = this.collection.models;
    for (var i = 0; i < models.length; i++) {
      var subView = new this.modelView({model: models[i]});
      subView.render();
      this.$el.append( subView.$el );
      subView.delegateEvents();
    }
    return this;
  }
});
