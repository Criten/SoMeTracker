####
# Logout Route
#
# When the user hits the logout route (/#/sessions/destory) the enter function will instantly 
# destroy the session through the API, and once that successeds, in the app. There are some tricky
# states that go on here... and i'm not sure why we have to force it to delete.uncommitted after
# our second time deleteting the record.
####

SoMeTracker.SessionsDestroyRoute = Ember.Route.extend
  enter: ->
    @controllerFor('currentUser').set('content', undefined)
    
    @store.find('session', 'current').then (session) ->
      session.deleteRecord()
      session.transitionTo 'deleted.uncommitted'
      session.save().then (session) ->
        session.transitionTo 'loaded.created.uncommitted'
    , (e)->
      console.log 'User isnt even logged in.. what are you doing?'

    @transitionTo 'index'
