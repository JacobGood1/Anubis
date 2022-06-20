accessing
read: source
	| path |
	path := (FileSystem workingDirectory / 'pharo-local/iceberg/JacobGood1/Anubis') .
	"self halt."
	
	OSWSWinProcess new 
		workingDirectory: path pathString;
		shellCommand: (path / 'anubis-reader.exe') pathString
		arguments: #(source '>' 'tmp.txt');
		runAndWait.