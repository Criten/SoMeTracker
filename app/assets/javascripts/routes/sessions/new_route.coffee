SoMeTracker.SessionsNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'session'

  setupController: (controller, model) ->
    controller.set 'content', model
