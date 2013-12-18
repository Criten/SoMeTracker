SoMeTracker.UsersNewRoute = Ember.Route.extend
  model: ->
    return @store.createRecord('user')

  setupController: (controller, model) ->
    controller.set 'content', model

  actions:
    error: (error, transition) ->
      console.log error.message
