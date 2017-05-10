## symbol is unique
p "abc".object_id
p "abc".object_id
p :abc.object_id
p :abc.object_id

## identifier
p Symbol.all_symbols
p Symbol.all_symbols.size
p abc = 1
p Symbol.all_symbols.size
p Symbol.all_symbols.grep(/abc/)


## symbol as method arg

## symbol as hash key