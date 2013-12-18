SoMeTracker.SessionsNewController = Ember.ObjectController.extend
  needs: ['currentUser']

  actions:
    save: ->
      this.content.save().then =>
        userJSON = @content.toJSON()
        userJSON.id = 'current'
        debugger
        object = @store.load(App.User, userJSON)
        user = @store.find 'user', 'current'

        @get('controllers.currentUser').set('content', user)
        @transitionToRoute 'index'
      , (a)->
    cancel: ->
      @content.deleteRecord()
      @transitionToRoute 'index'

    test: ->
      debugger
