Cache for character set. Pre-evaluates block for the first 255 characters and remembers its result.

Serves as parsing optimization, if the next character in a stream does not match, the whole parser is going to fail. 