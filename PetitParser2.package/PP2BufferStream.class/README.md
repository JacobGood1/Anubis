Adapter from minimal stream implementation to the interface consumed by PP2Nodes.

Given minimal stream interface with two methods:
- atEnd
- next
PP2BufferStream will provide extra functionality and buffering to ensure the minimal stream can be consumed by PP2Nodes.

Note: Everyting in this stream is indexed from 0 and not from 1. Modulo arithmetics that works better when indexed from 0.