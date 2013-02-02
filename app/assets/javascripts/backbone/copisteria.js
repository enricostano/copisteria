#= require_self
#= require_tree ../../templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers

window.Copisteria = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {},
  initialize: function(data) {
    this.users = new Copisteria.Collections.Users(data.users);

    new Copisteria.Routers.Users({ users: this.users });
    if (!Backbone.history.started) {
      Backbone.history.start();
      Backbone.history.started = true;
    }
  }
};
