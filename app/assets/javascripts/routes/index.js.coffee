Launchpad.IndexRoute = Ember.Route.extend
  model: ->
    Launchpad.Article.find()
  setupController: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'home')
    @controllerFor('application').resetTitle    
    controller.set('articles', model)


