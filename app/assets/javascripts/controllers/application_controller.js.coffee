Launchpad.ApplicationController = Ember.Controller.extend
  isHome:     (-> @get('currentRoute') == 'home').property('currentRoute')
  isUsers:    (-> @get('currentRoute') == 'users').property('currentRoute')
  isArticles: (-> @get('currentRoute') == 'articles').property('currentRoute')