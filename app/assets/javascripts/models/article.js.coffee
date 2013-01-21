Launchpad.Article = DS.Model.extend
  title: DS.attr('string')
  content:  DS.attr('string')
  slug: DS.attr('string')

  body: (->
    @get('content')
  ).property('content')