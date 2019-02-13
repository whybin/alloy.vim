" Vim syntax file
" Language:     Alloy
" Maintainer:   whybin

if exists("b:current_syntax")
    finish
endif

" Keywords
syn keyword alloyKeyword     abstract and assert but disj else exactly
syn keyword alloyKeyword     fact for fun iff implies in let
syn keyword alloyKeyword     not open or pred set sum

syn keyword alloyQuantifier  all some one lone no
syn keyword alloyCommand     check run
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

syn match alloyColon    /:/
syn match alloyBar      /|/
syn match alloyBraces   /[{}]/
syn match alloyBrackets /[\[\]]/

" Convention of keeping only types capitalized
if get(g:, 'alloy_capitalize_types', 0)
    syn match alloyType /\<[A-Z]\(\w\|[_'"]\)*/
endif

" Names
syn keyword alloyThisNamespace this contained nextgroup=alloyNamespaceDelim
            \ skipwhite skipempty
syn match alloyNamespaceDelim +\/+ contained nextgroup=alloyType
            \ skipwhite skipempty
syn match alloyType /\<\a\(\w\|[_'"]\)*/ contained nextgroup=@alloyAfterType
            \ skipwhite skipempty
syn match alloyCommaDelim /,/ contained nextgroup=@alloyQualName
            \ skipwhite skipempty
syn match alloyTypeUnionOp /+/ contained nextgroup=@alloyQualName
            \ skipwhite skipempty
syn cluster alloyAfterType
            \ contains=alloyCommaDelim,alloyNamespaceDelim,alloyTypeUnionOp
syn cluster alloyQualName contains=alloyType,alloyThisNamespace

" Module
syn keyword alloyModule module nextgroup=@alloyQualName skipwhite skipempty

" Imports
syn keyword alloyImport open nextgroup=alloyQualImport skipwhite skipempty
" e.g. util/ordering
syn match alloyQualImport /\<\a\(\w\|[_'"]\)*/
            \ contained nextgroup=alloyQualDelim,alloyImportParams,alloyImportAs
            \ skipwhite skipempty
syn match alloyQualDelim +\/+ contained nextgroup=alloyQualImport
            \ skipwhite skipempty
syn region alloyImportParams matchgroup=alloyBrackets start=/\[/ end=/]/
            \ contained contains=@alloyQualName,alloyCommaDelim
            \ nextgroup=alloyImportAs skipwhite skipempty
syn keyword alloyImportAs as contained nextgroup=alloyImportAlias
            \ skipwhite skipempty
syn match alloyImportAlias /\<\a\(\w\|[_'"]\)*/ contained

" Sig
syn keyword alloySig sig nextgroup=alloySigType skipwhite skipempty
syn match alloySigType /\<\a\(\w\|[_'"]\)*/ contained
            \ nextgroup=alloySigDelim,alloySigExt skipwhite skipempty
syn match alloySigDelim /,/ contained nextgroup=alloySigType
            \ skipwhite skipempty
syn keyword alloySigExt extends in contained nextgroup=@alloyQualName
            \ skipwhite skipempty

syn match alloyNumber /\(\w\|['"]\)\@<!\zs-\?[1-9][0-9]*\>/

syn match alloyLabel /^\s*[a-zA-Z]\(\w\|[_'"]\)*:\ze\_s*\(run\|check\)/

" Comments
syn region alloyComment start="//" end="$"    contains=@Spell
            \ containedin=ALLBUT, alloyComment
syn region alloyComment start="--" end="$"    contains=@Spell
            \ containedin=ALLBUT, alloyComment
syn region alloyComment start="/\*" end="\*/" contains=@Spell
            \ containedin=ALLBUT, alloyComment

hi def link alloyQuantifier     alloyKeyword
hi def link alloySig            alloyKeyword
hi def link alloySigExt         alloyKeyword
hi def link alloyImport         alloyKeyword
hi def link alloyImportAs       alloyKeyword
hi def link alloyModule         alloyKeyword
hi def link alloyKeyword        Keyword

hi def link alloyQualImport     Include
hi def link alloyImportAlias    Include
hi def link alloyCommand        Function

hi def link alloyBuiltinType    alloyType
hi def link alloyConstType      alloyType
hi def link alloyType           Type

hi def link alloySingleTokenOp  alloyOperator
hi def link alloyTypeUnionOp    alloyOperator
hi def link alloyOperator       Operator

hi def link alloyColon          alloyDelimiter
hi def link alloyCommaDelim     alloyDelimiter
hi def link alloyNamespaceDelim alloyDelimiter
hi def link alloyQualDelim      alloyDelimiter
hi def link alloySigDelim       alloyDelimiter
hi def link alloyDelimiter      Delimiter

hi def link alloyBar            Function
hi def link alloyBraces         Function
hi def link alloyBrackets       Function

hi def link alloySigType        alloyType
hi def link alloyThisNamespace  Identifier
hi def link alloyQualName       alloyType

hi def link alloyNumber         Number

hi def link alloyLabel          PreProc

hi def link alloyComment Comment

let b:current_syntax = "alloy"
