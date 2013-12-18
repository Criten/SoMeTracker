# For more information see: http://emberjs.com/guides/routing/

SoMeTracker.Router.map ()->
  @resource 'users', ->
    @route 'new'

  @resource 'sessions', ->
    @route 'new'
    @route 'destroy'
