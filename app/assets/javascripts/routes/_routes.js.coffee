Launchpad.Router.map ->
  @resource 'users', ->
    @route 'show', path: '/:id'
  @resource 'articles', ->
    @route 'show', path: '/:id'
  true

Launchpad.Router.reopen
  location: 'history'
  rootURL: '/'