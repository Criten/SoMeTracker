SoMeTracker.UsersNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @content.save().then =>
        @transitionToRoute 'index'
      , =>
        @get('content').transitionTo('loaded.created.uncommitted')

    cancel: ->
      @content.deleteRecord()
      @transitionToRoute 'index'
