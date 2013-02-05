Launchpad.User = DS.Model.extend
  email: DS.attr('string')
  display_name: DS.attr('string')
  first_name: DS.attr('string')
  last_name: DS.attr('string')
  articles: DS.hasMany('Launchpad.Article')
