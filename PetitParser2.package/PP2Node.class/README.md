Base class for all the nodes of PP2. 

PP2 parsers are graphs consisting of PP2 nodes. Each PP2 node is a parser combinator that provides information about the combinator and refers to other nodes. Each parser combinator does one thing and delegates other work to other nodes. For example:

   'a' asParser, 'b' asParser

is a sequence node (which knows how to parse sequence), while 'a' and 'b' are represented by literal nodes (which know how to parse literals).

Each PP2 node is visitable. Visitors are mainly used to implement optimizations and aditional analyses, but can be used for other purposes if needed. 