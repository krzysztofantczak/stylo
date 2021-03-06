class Opacity extends Spine.Controller
  className: 'opacity'

  events:
    'change input': 'change'
    'focus input': 'inputFocus'

  elements:
    'input': '$inputs'

  render: =>
    @disabled = not @stage.selection.isAny()
    @opacity  = @stage.selection.get('opacity') ? 1

    @html JST['app/views/inspector/opacity'](this)

  change: (e) ->
    @stage.history.record('opacity')

    val = parseFloat($(e.currentTarget).val())
    val = Math.round(val * 100) / 100

    @stage.history.record('opacity')
    @stage.selection.set('opacity', val)
    @$inputs.val(val)

module.exports = Opacity