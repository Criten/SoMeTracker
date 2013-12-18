SoMeTracker.SessionsDestroyRoute = Ember.Route.extend
  enter: ->
    controller = @controllerFor('currentUser')
    controller.set('content', undefined)
    
    @store.find('current').then (session) ->
      session.deleteRecord()
      session.save()

    this.transitionTo('index')
