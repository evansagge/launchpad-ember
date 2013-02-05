Launchpad.Article = DS.Model.extend
  title: DS.attr('string')
  slug: DS.attr('string')
  body: DS.attr('string')
  user: DS.belongsTo('Launchpad.User')