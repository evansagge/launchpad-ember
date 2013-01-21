Launchpad.UsersRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('application').set('currentRoute', 'users')

Launchpad.UsersIndexRoute = Launchpad.UsersRoute.extend
  model: ->
    Launchpad.User.find()
  setupController: (controller, model) ->
    @_super()
    controller.set('users', model)

Launchpad.UsersShowRoute = Launchpad.UsersRoute.extend
  model: (params) ->
    Launchpad.User.find(params.id)
  setupController: (controller, model) ->
    @_super()
    controller.set('content', model)