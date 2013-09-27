set commentstring=##\ %s
let b:match_words = '#{\?\(if\|foreach\|define\|macro\|@[a-zA-Z][a-zA-Z0-9\-_]*\)\s*('.':'
                  \.'#\(else\>\|{else}\)'.':'
                  \.'#\(elseif\>\|{elseif}\)'.':'
                  \.'#\(end\>\|{end}\),
                  \.<:>,<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
