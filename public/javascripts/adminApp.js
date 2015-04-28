var app = app || {};

app.foods = new FoodCollection({
  model: app.FoodModel
});

app.foods.fetch();
