# fullstack-scriber

## Run

docker-compose up csharp-auto-suggest

docker-compose up swift-auto-suggest

## Debug

docker run --mount "type=bind,src=$(pwd)/SwiftAutoSuggest,target=/code"  -it swift:5.1 /bin/bash

swift -version

/code/.build/debug/swiftautosuggest

