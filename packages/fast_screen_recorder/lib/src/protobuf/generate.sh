set -eux

protoc --proto_path=. --dart_out=./generated ./fast_screen_recorder.proto
