" Vim syntax file
" Language:     Junos Configuration
" Maintainer:   Tim Zehta <tim@clockwork.net>
" Last Change:  2013-01-26
" Version:      3
" URL:          https://github.com/ClockworkNet/vim-junos-syntax
" Credits:      ...


" Quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif


setlocal iskeyword+=-


" Comments
syn region junosComment start=#\V/*# end=#\V*/# oneline contains=junosURL
syn match junosComment /^\s*##.*$/ contains=junosURL


" Constants
"   console type
syn match junosConstant /\v(console type\s)@<=[a-z-]+(;)@=/
"   class
syn match junosConstant /\v(class\s)@<=[a-z-]+(;)@=/
"   default applications
syn match junosConstant /\vjunos-[a-z-]+/
"   family
syn match junosConstant /\v(family\s)@<=[a-z-]+(\s\{)@=/
"   file
syn match junosConstant /\v(file\s)@<=[a-z-]+(\s\{)@=/
"   log levels (also matches policy constant 'any')
syn match junosConstant /\valert|any|critical|emergency|error|info|none|notice|warning(;)@=/
"   protocol
syn match junosConstant /\v(protocol\s)@<=[a-z-]+(;)@=/
"   static-nat
syn match junosConstant /\v(static-nat\s)@<=[a-z-]+(;)@=/
"   syn-flood-protection-mode
syn match junosConstant /\v(syn-flood-protection-mode\s)@<=[a-z-]+(;)@=/


" Debug
syn match junosHeader /\v(version\s)@<=[0-9R.]+(;)@=/


" Errors
syn match junosError /## SECRET-DATA.*/


" Functions
syn match junosNumber /\v( \d+[ ;]| \d+\a[ ;])/ contained contains=junosSymbol
"   bare functions
syn match junosFunction /\v^\s*[a-z-]{3,}(;)@=/
"   function with a single value
syn match junosFunction /\v^\s*[a-z-]{2,} (.+;)@=/ contains=junosFunction
"   multi word functions containing IPs or numbers
syn match junosFunction /\v^\s*([0-9a-z./-]+ ){3,}([0-9a-z./-]+)(;)@=/ contains=junosIP,junosNumber
"   static-nat subfunction
syn match junosFunction /\v(static-nat\s)@<=[a-z-]+(\s[0-9./:]+;)@=/
"   edge cases
syn match junosFunction /console type/
syn match junosFunction /from zone/
syn match junosFunction /then accept/
syn match junosFunction /to zone/


" IPs
syn match JunosIpSep #/\|\.# contained
syn match junosIP /\v(\d{1,3}\.){3}\d{1,3}(\/\d{1,2})?/ contains=JunosIpSep

" IPv6
syn match IP6Sep #/\|\:# contained
syn match IP6addr /\v(\x{1,4}:){1,7}:*(\x{1,4})?(\/\d+)?/ contains=IP6Sep

"syn match IP6addr /\v(\x{1,4}:){1}:(\x{1,4})?(\/\d+)?/ contains=IP6Sep
"syn match IP6addr /\v(\x{1,4}:){2}:(\x{1,4})?(\/\d+)?/ contains=IP6Sep
"syn match IP6addr /\v(\x{1,4}:){3}:(\x{1,4})?(\/\d+)?/ contains=IP6Sep
"syn match IP6addr /\v(\x{1,4}:){4}:(\x{1,4})?(\/\d+)?/ contains=IP6Sep
"syn match IP6addr /\v(\x{1,4}:){5}:(\x{1,4})?(\/\d+)?/ contains=IP6Sep
"syn match IP6addr /\v(\x{1,4}:){6}:(\x{1,4})?(\/\d+)?/ contains=IP6Sep
"syn match IP6addr /\v(\x{1,4}:){7}:(\x{1,4})?(\/\d+)?/ contains=IP6Sep

hi link IP6addr Identifier
hi link IP6Sep Comment


"syn match IP6Sep #/\|\:# contained
" Plain IPv6 address     IPv6-embedded-IPv4 address
" ---------------------------------------------------
" 1111:2:3:4:5:6:7:8     1111:2:3:4:5:6:127.0.0.1
"syn match IP6addr    "\s\zs\(\x\{1,4}:\)\{6}\(\x\{1,4}:\x\{1,4}\|\([0-2]\?\d\{1,2}\.\)\{3}[0-2]\?\d\{1,2}\)\s*$" contains=IP6Sep
" ::[...:]8              ::[...:]127.0.0.1
"syn match IP6addr    "\s\zs::\(\(\x\{1,4}:\)\{,6}\x\{1,4}\|\(\x\{1,4}:\)\{,5}\([0-2]\?\d\{1,2}\.\)\{3}[0-2]\?\d\{1,2}\)\s*$" contains=IP6Sep
" 1111::[...:]8          1111::[...:]127.0.0.1
"syn match IP6addr    "\s\zs\(\x\{1,4}:\)\{1}:\(\(\x\{1,4}:\)\{,5}\x\{1,4}\|\(\x\{1,4}:\)\{,4}\)\s*$" contains=IP6Sep
" 1111:2::[...:]8        1111:2::[...:]127.0.0.1 
"syn match IP6addr    "\s\zs\(\x\{1,4}:\)\{2}:\(\(\x\{1,4}:\)\{,4}\x\{1,4}\|\(\x\{1,4}:\)\{,3}\)\s*$" contains=IP6Sep
" 1111:2:3::[...:]8      1111:2:3::[...:]127.0.0.1
"syn match IP6addr    "\s\zs\(\x\{1,4}:\)\{3}:\(\(\x\{1,4}:\)\{,3}\x\{1,4}\|\(\x\{1,4}:\)\{,2}\)\s*$" contains=IP6Sep
" 1111:2:3:4::[...:]8    1111:2:3:4::[...:]127.0.0.1
"syn match IP6addr    "\s\zs\(\x\{1,4}:\)\{4}:\(\(\x\{1,4}:\)\{,2}\x\{1,4}\|\(\x\{1,4}:\)\{,1}\)?(\/\d+)\s*$" contains=IP6Sep
" 1111:2:3:4:5::[...:]8  1111:2:3:4:5::127.0.0.1
"syn match IP6addr    "\s\zs\(\x\{1,4}:\)\{5}:\(\(\x\{1,4}:\)\{,1}\x\{1,4}\|\([0-2]\?\d\{1,2}\.\)\{3}[0-2]\?\d\{1,2}\)\s*$" contains=IP6Sep
" 1111:2:3:4:5:6::8      -
"syn match IP6addr    "\s\zs\(\x\{1,4}:\)\{6}:\x\{1,4}\s*$" contains=IP6Sep
" 1111[:...]::           -
"syn match IP6addr    "\s\zs\(\x\{1,4}:\)\{1,7}:\s*$" contains=IP6Sep

"hi link IP6addr Identifier
"hi link IP6Sep Comment


" Statements
syn match junosStatement /\v^\s*[a-z-]+( \{$)@=/
syn match junosStatement /\v^\s*[a-z-]+ (.+\{$)@=/
syn keyword junosStatement to-zone


" Strings
syn region junosString start=#"# end=#"# skip=#\\\\\|\\"# oneline contains=junosVariable
syn region junosString start=#'# end=#'# skip=#\\\\\|\\'# oneline contains=junosVariable


" Symbols
syn match junosSymbol /[{}]/
syn match junosSymbol /\v\[|\]|;$/


" URLs
syn match junosURL #\vhttps?://[[:graph:]]+# contains=junosSymbol


" Variables
syn match junosVariable /\V<*>/
syn match junosVariable /[$]{[^}]\+}/
syn match junosVariable /\V*/


" Highlight
hi link junosComment Comment
hi link junosConstant Constant
hi link junosError Error
hi link junosFunction Function
hi link junosHeader Debug
hi link junosIP Identifier
hi link junosIpSep Comment
hi link junosNumber Normal
hi link junosStatement Statement
hi link junosString String
hi link junosSymbol Delimiter
hi link junosURL Underlined
hi link junosVariable Identifier


let b:current_syntax = "junos"
