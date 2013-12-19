Ember.Application.initializer
  name: "currentUser"

  initialize: (container, application) ->
    store = container.lookup('store:main')
    
    store.find('session', 'current').then (session) ->
      console.log 'logged in'
      userJSON = session.toJSON()
      userJSON.id = 'current'
      object = store.push('user', userJSON)
      container.lookup('controller:currentUser').set('content', object)
      container.typeInjection('controller', 'currentUser', 'controller:currentUser')
    , ->
      console.log 'not logged in!'

