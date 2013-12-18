SoMeTracker.SessionsNewController = Ember.ObjectController.extend
  needs: ['currentUser']

  actions:
    save: ->
      this.content.save().then =>
        userJSON = @content.toJSON()
        userJSON.id = 'current'
        object = @store.push('user', userJSON)
        user = @store.find 'user', 'current'

        @get('controllers.currentUser').set('content', user)
        @transitionToRoute 'index'
      , (a)=>
        @get('content').transitionTo('loaded.created.uncommitted')
    cancel: ->
      @content.deleteRecord()
      @transitionToRoute 'index'

    test: ->
      debugger
