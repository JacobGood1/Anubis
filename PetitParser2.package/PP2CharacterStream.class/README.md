Adapter from stream of bytes (stream is the instance varaible) to stream of characters.  Encoder (instance variable) translates incoming bytes into characters. 

Can be used to convert Zinc byte streams:
	byteStream := ZnClient new
 		url: 'http://pharo.org';
  		streaming: true;
  		get.
	stream := PP2CharacterStream on: byteStream encoder: ZnUTF8Encoder new.
	
Call #asPetit2Stream to convert to the interface accepted by PP2Node>>parse: