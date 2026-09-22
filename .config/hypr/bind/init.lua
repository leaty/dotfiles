local table = require('lib.table')
return table.merge(
	require('bind.misc'),
	require('bind.window'),
	require('bind.workspace'),
	require('bind.media'),
	require('bind.app')
)
