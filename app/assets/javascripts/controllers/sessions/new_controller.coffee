SoMeTracker.SessionsNewController = Ember.ObjectController.extend
  needs: ['currentUser']

  actions:
    save: ->
      this.content.save().then =>
        userJSON = @content.toJSON()
        userJSON.id = 'current'
        object = @store.push('user', userJSON)
        @get('controllers.currentUser').set('content', object)
        @transitionToRoute 'index'
      , (err)=>
        @get('content').transitionTo('loaded.created.uncommitted')
    cancel: ->
      @content.deleteRecord()
      @transitionToRoute 'index'
