
Launchpad.ArticlesRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('application').set('currentRoute', 'articles')

Launchpad.ArticlesShowRoute = Launchpad.ArticlesRoute.extend
  model: (params) ->
    Launchpad.Article.find(params.id)
  setupController: (controller, model) ->
    @_super()
    controller.set('title', model.get('title'))
    controller.set('content', model)