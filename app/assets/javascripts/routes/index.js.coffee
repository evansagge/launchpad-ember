Launchpad.IndexRoute = Ember.Route.extend
  model: ->
    Launchpad.Article.find()
  setupController: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'home')
    controller.set('articles', model)


