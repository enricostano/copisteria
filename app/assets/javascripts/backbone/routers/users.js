Copisteria.Routers.Users = Backbone.Router.extend({
  initialize: function(options) {
    this.users = options.users;
  },

  routes: {
    "users": "index",
    "user/:id": "show"
  },

  index: function() {
    var view = new Copisteria.Views.UsersIndex({
      collection: Copisteria.users,
    });
    $('#content').html(view.render().$el);
  },

  show: function(userId) {
    var user = this.users.get(userId);
    user.fetch({
      success: function() {
        alert('yesss');
        var view = new Copisteria.Views.UserShow({ model: user });
        $('#content').html(view.render().$el);
      }
    });
  }

});
