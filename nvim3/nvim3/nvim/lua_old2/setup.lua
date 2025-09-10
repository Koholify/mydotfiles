--local Path = require'plenary.path'
require('tasks').setup({
	default_params = {
		cmake = {
			args = {
				configure = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1', '-G', 'Unix Makefiles'},
			},
		},
	}
})
