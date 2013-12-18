SoMeTracker.CurrentUserController = Ember.ObjectController.extend
  isSignedIn: (->
    this.get('content') && this.get('content').get('isLoaded')
  ).property 'content'
