{CompositeDisposable} = require 'atom'
sortSass = require 'sort-sass'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-text-editor',
      'sort-sass:sort': => @sort()

  deactivate: ->
    @subscriptions.dispose()

  sort: ->
    editor = atom.workspace.getActiveTextEditor()
    text = editor.getText()
    editor.setText sortSass text
