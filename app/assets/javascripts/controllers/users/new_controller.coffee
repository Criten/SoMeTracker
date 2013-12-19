SoMeTracker.UsersNewController = Ember.ObjectController.extend
  actions:
    save: ->
      @content.save().then =>
        @transitionToRoute 'index'

    cancel: ->
      @content.deleteRecord()
      @transitionToRoute 'index'
