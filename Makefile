.PHONY: proto
proto-gen:
	rm -rf ./dist
	mkdir -p ./dist/go
	mkdir -p ./dist/js
	mkdir -p ./dist/rust
	@echo "Generating Go code from .proto files..."
	@cargo build --release
	@protoc --go_out=paths=source_relative:./dist/go --go_opt=paths=source_relative ./proto/*.proto
	@protoc --plugin=./node_modules/ts-proto/protoc-gen-ts_proto --ts_proto_out=./dist/js ./proto/*.proto --ts_proto_opt=esModuleInterop=true
	@echo "Proto compilation complete."