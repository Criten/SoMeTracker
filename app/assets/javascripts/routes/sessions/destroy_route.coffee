SoMeTracker.SessionsDestroyRoute = Ember.Route.extend
  enter: ->
    controllerFor('currentUser').set('content', undefined)
    
    @store.find('session', 'current').then (session) ->
      session.deleteRecord()
      session.transitionTo 'deleted.uncommitted'
      session.save().then (session) ->
        session.transitionTo 'loaded.created.uncommitted'
    , (e)->
      console.log 'User isnt even logged in.. what are you doing?'

    @transitionTo 'index'
