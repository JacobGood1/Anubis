Basic stream used by PetitParser2. Any input passed to PP2Node>>parse is converted to PP2Stream or compatible interface (e.g. PP2BufferStream) calling asPetit2Stream.

If PP2Stream is not suitable for your needs, consider using PP2BufferStream.