####
# When the app is loading we want to check to see if the user already has a current session
# they might have refreshed the page or came back to it after leaving the page.. so this
# initializer will check this state before the app readys.
####

Ember.Application.initializer
  name: "currentUser"

  initialize: (container, application) ->
    store = container.lookup('store:main')
    application.deferReadiness()

    store.find('session', 'current').then (session) ->
      console.log 'logged in'
      userJSON = session.toJSON()
      userJSON.id = 'current'
      object = store.push('user', userJSON)
      container.lookup('controller:currentUser').set('content', object)
      container.typeInjection('controller', 'currentUser', 'controller:currentUser')
      application.advanceReadiness()
    , ->
      application.advanceReadiness()
