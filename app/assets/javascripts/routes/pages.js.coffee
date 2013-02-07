Launchpad.PagesShowRoute = Ember.Route.extend
  renderTemplate: ->
    @render 'pages/show'

Launchpad.AboutRoute = Launchpad.PagesShowRoute.extend
  model: (params) ->
    Launchpad.Page.find('about')
  setupController: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'about')
    @controllerFor('application').updateTitle('About')
    controller.set('content', model)
  
Launchpad.ResumeRoute = Launchpad.PagesShowRoute.extend
  model: (params) ->
    Launchpad.Page.find('resume')
  setupController: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'resume')
    @controllerFor('application').updateTitle('Resume')
    controller.set('content', model)    