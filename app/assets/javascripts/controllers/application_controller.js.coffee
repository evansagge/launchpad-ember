Launchpad.ApplicationController = Ember.Controller.extend
  isHome:     (-> @get('currentRoute') == 'home').property('currentRoute')
  isArticles: (-> @get('currentRoute') == 'articles').property('currentRoute')
  isAbout:    (-> @get('currentRoute') == 'about').property('currentRoute')
  isResume:   (-> @get('currentRoute') == 'resume').property('currentRoute')

  updateTitle: (title) ->
    titles = [ "Evan Sagge" ]
    titles.push title if title?
    console.log titles
    document.title = titles.join(" - ")

  resetTitle:
    document.title = "Evan Sagge"