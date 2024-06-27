use protobuf_codegen::Codegen;

fn main() {
    Codegen::new()
        .protoc()
        .cargo_out_dir("protos")
        .input("proto/function.proto")
        .include("proto")
        .run_from_script();
}