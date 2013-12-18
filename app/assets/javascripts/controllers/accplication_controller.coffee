SoMeTracker.ApplicationController = Ember.ObjectController.extend
  needs: ['currentUser']

  actions:
    test: ->
      debugger
