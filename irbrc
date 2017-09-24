require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1_000_000
IRB.conf[:HISTORY_FILE] = ENV['IRB_HISTFILE']
IRB.conf[:BACK_TRACE_LIMIT] = 1_000
