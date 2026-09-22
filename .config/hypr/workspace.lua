local monitor = require('monitor')
 
return {
	term	= { id = 1, key = 'Z', monitor = monitor.main.output, default = true },
	code	= { id = 2, key = 'X', monitor = monitor.main.output },
	web 	= { id = 3, key = 'SUPER + C', monitor = monitor.main.output },
	search	= { id = 4, key = 'C', monitor = monitor.main.output },
	game	= { id = 5, key = 'B', monitor = monitor.main.output },
	chat	= { id = 6, key = 'V', monitor = monitor.right.output, default = true },
	music	= { id = 7, key = 'N', monitor = monitor.right.output },
	mail	= { id = 8, key = 'M', monitor = monitor.right.output },
}
