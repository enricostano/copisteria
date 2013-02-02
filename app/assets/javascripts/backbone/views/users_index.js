Copisteria.Views.UsersIndex = Backbone.View.extend({
  render: function () {
    this.$el.html(JST['users/index'] ({ users: this.collection }));
    return this;
  }
});
