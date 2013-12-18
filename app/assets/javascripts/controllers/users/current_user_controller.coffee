SoMeTracker.CurrentUserController = Ember.ObjectController.extend
  isSignedIn: (->
    console.log 'asdf'
    this.get('content') && this.get('content').get('isLoaded')
  ).property 'content.email'
