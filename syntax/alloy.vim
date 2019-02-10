" Vim syntax file
" Language:     Alloy
" Maintainer:   whybin

if exists("b:current_syntax")
    finish
endif

" Keywords
syn keyword alloyKeyword    abstract and as assert
syn keyword alloyKeyword    but disj else exactly
syn keyword alloyKeyword    extends fact for fun
syn keyword alloyKeyword    iff implies in let
syn keyword alloyKeyword    module not
syn keyword alloyKeyword    open or pred
syn keyword alloyKeyword    set sum
syn keyword alloyQuantifier all some one lone no
syn keyword alloyCommand    check run
syn keyword alloyBuiltinType int Int
syn keyword alloyConstType   iden none univ

" Operators
syn match alloyOperator      /!/
syn match alloyOperator      /#/
syn match alloyOperator      /\~/
syn match alloyOperator      /*/
syn match alloyOperator      /\^/
syn match alloyOperator      /+/
syn match alloyOperator      /-/
syn match alloyOperator      /\./
syn match alloyOperator      /=/
syn match alloyOperator      /</
syn match alloyOperator      />/
syn match alloyOperator      /&/
syn match alloySingleTokenOp /=>/
syn match alloySingleTokenOp /<=>/
syn match alloySingleTokenOp />=/
syn match alloySingleTokenOp /=</
syn match alloySingleTokenOp /->/
syn match alloySingleTokenOp /<:/
syn match alloySingleTokenOp /:>/
syn match alloySingleTokenOp /++/
syn match alloySingleTokenOp /&&/
syn match alloySingleTokenOp /||/

syn match alloyDelimiter /:/
syn match alloyBar       /|/
syn match alloyBraces    /[{}]/
syn match alloyBrackets  /[\[\]]/

syn keyword alloyKeyword sig nextgroup=alloySigNames skipwhite skipempty
syn match alloySigNames  /[^{]\+/ contained
            \ contains=alloyKeyword,alloySigType,alloyQualName
syn match alloySigType   /\<[a-zA-Z]\(\w\|[_'"]\)*/ contained 

if get(g:, 'alloy_uppercase_types', 0)
    syn match alloyUserType /\<[A-Z]\(\w\|[_'"]\)*/
endif

syn keyword alloyThisNamespace this contained
syn match alloyNamespaceDelim +/+ contained
syn match alloyQualName +\<[a-zA-Z]\(\w\|[_'"/]\)*+ contained
            \ contains=alloyThisNamespace,alloyNamespaceDelim

syn match alloyNumber /-\=[1-9][0-9]*\>/

syn match alloyLabel /^\s*[a-zA-Z]\(\w\|[_'"]\)*:/

" Comments
syn region alloyComment start="//" end="\n" contains=@Spell
syn region alloyComment start="--" end="\n" contains=@Spell
syn region alloyComment start="/\*" end="\*/" contains=@Spell

hi def link alloyQuantifier alloyKeyword
hi def link alloyKeyword    Keyword
hi def link alloyCommand    Function

hi def link alloyBuiltinType alloyType
hi def link alloyConstType   alloyType
hi def link alloyType        Type

hi def link alloySingleTokenOp alloyOperator
hi def link alloyOperator      Operator

hi def link alloyDelimiter     Operator
hi def link alloyBar           Function
hi def link alloyBraces        Function
hi def link alloyBrackets      Function

hi def link alloySigType       alloyType
hi def link alloyUserType      alloyType
hi def link alloyThisNamespace Identifier
hi def link alloyQualName      alloyType

hi def link alloyNumber Number

hi def link alloyLabel Label

hi def link alloyComment Comment

let b:current_syntax = "alloy"
