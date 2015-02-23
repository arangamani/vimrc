" RCL syntax file
" Filename:     rcl.vim
" Language:     Rightscale Cloudflow Language
" Maintainer:   Raphael Simon <raphael@rightscale.com>
" Version:      1.0
"

" Copied from the cfengine, ruby, and perl syntax files
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match   rclGlobalVariable  "$$[_[:alpha:]][_[:alnum:]]*"
syn match   rclVariable        "$[_[:alpha:]][_[:alnum:]]*"
syn match   rclDelimiter       "[\[\](){}]"
syn match   rclOperator        "=\|+\|-\|*\|/\|^\|%\|&\||"
syn match   rclOperator        "=\~\|!\~\|==\|!=\|&&\|||"
syn match   rclSeparator       ":\|\."
syn match   rclComma           ","
syn match   rclAttribute       "\<\%(on_rollback\|on_error\|on_timeout\|task_name\|task_prefix\|timeout\|wait_task\|api_trace\)\>\ze:"
syn match   rclObjectField     "\<\%(on_rollback\|on_error\|on_timeout\|task_name\|task_prefix\|timeout\|wait_Task\|api_trace\)\@!\zs\w\+\ze\>:"

syn match   rclDefName         "\<\w\+\ze("
syn region  rclReference       start="@@\?[_[:alpha:]][_[:alnum:]]*" matchgroup=rclDelimiter end="(\|\[\|\s" contains=rclField,rclAction,rclComma
syn region  rclResourceExp     start="\<\w\+\.\w\+\%(\.\w\+\)*" matchgroup=rclDelimiter end="\s\|(\|\[)" contains=rclField,rclAction,rclSeparator

syn match   rclField           ":\w\+" contained contains=rclSeparator
syn match   rclAction          "\.\w\+\ze(" contained contains=rclSeparator

syn keyword rclBoolean         true false
syn region  rclString start=+"+ skip=+\\"+ end=+"+
syn region  rclString start=+'+ skip=+\\'+ end=+'+
syn match   rclDuration        "\<\d\+[yMwdhms]\%(\d\+[yMwdhms]\)*\>"
syn match   rclNumber          "\<\d\+\%(\.\d\+\)\?\%([eE][+-]\?\d\+\)\?\>"
syn keyword rclNull            null

syn keyword rclKeyword         retrieve alias call assert raise do
syn keyword rclTaskControl     wait_task cancel_task pause_task resume_task abort_task expect_task
syn keyword rctProcessControl  pause resume cancel abort
syn keyword rclConditional     elsif else

syn keyword rclFunction        size first last sort select unique
syn match   rclFunction        "contains?\|empty?\|any?\|all?"
syn keyword rclFunction        to_s to_n to_b to_d to_a to_json from_json
syn keyword rclFunction        self tag_value task_name tasks task_status type inspect
syn keyword rclFunction        log_info log_title log_error
syn keyword rclFunction        split
syn keyword rclFunction        http_get http_post http_put http_delete http_options http_trace http_head http_patch
syn keyword rclFunction        now uuid sleep sleep_until sleep_while keys values xpath

syn match   rclDefine         "\<define\>"
syn match   rclBegin          "\<\%(sub\|concurrent\)\>"
syn match   rclRepeat         "\<\%(map\|foreach\|in\|while\|concurrent map\|concurrent foreach\)\>"
syn match   rclIf             "\<if\>"

syn region  rclDefineBlock    start="\<define\>" matchgroup=rclDefine end="\<end\>" keepend extend contains=ALLBUT,rclField,rclAction
syn region  rclBeginBlock     start="\<\%(begin\|concurrent begin\)\>" matchgroup=rclBegin end="\<end\>" keepend extend contains=ALLBUT,rclField,rclAction
syn region  rclRepeatBlock    start="\<\%(map\|foreach\|while\|concurrent map\|concurrent foreach\)\>" matchgroup=rclRepeat end="\<end\>" keepend extend contains=ALLBUT,rclField,rclAction
syn region  rclIfBlock        start="\<if\>" matchgroup=rclIf end="\<end\>" keepend extend contains=ALLBUT,rclField,rclAction
