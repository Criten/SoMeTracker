SoMeTracker.ApplicationController = Ember.ObjectController.extend
  needs: ['currentUser']

  curentUser: (->
    @get 'controllers.currentUser'
  ).property 'controllers.currentUser.content.email'
