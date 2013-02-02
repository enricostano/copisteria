Copisteria.Routers.Users = Backbone.Router.extend({
  routes: {
    "": "index"
  },

  index: function() {
    var view = new Copisteria.Views.UsersIndex({
      collection: Copisteria.users,
    });
    $('#content').html(view.render().$el);
  }
});
