--key maps and options have precedence over plugins due to the order
require('user.options')
require('user.keymaps')
require('user.lazy')
require('user.ayu-sun.init').colorscheme()

