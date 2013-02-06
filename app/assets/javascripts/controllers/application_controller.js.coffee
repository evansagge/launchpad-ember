Launchpad.ApplicationController = Ember.Controller.extend
  isHome:     (-> @get('currentRoute') == 'home').property('currentRoute')
  isArticles: (-> @get('currentRoute') == 'articles').property('currentRoute')
  isAbout:    (-> @get('currentRoute') == 'about').property('currentRoute')
  isResume:   (-> @get('currentRoute') == 'resume').property('currentRoute')