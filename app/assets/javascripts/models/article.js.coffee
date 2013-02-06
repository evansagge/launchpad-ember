Launchpad.Article = DS.Model.extend
  title: DS.attr('string')
  slug: DS.attr('string')
  body: DS.attr('string')
  summary: DS.attr('string')
  summarized: DS.attr('boolean')
  user: DS.belongsTo('Launchpad.User')