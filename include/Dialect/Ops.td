#ifndef JAYSON_OPS
#define JAYSON_OPS

include "mlir/IR/OpBase.td"
include "JaysonDialect.td"

class J_Op<string mnemonic, list<Trait> traits = []> :
    Op<Jayson_Dialect, mnemonic, traits>;

def J_LoadOp : J_Op<"jayson.load", []> {
  let summary = "Load operation in Jayson dialect";
  let arguments = (ins AnyType:$address);
  let results = (outs AnyType:$value);
}

#endif // JAYSON_OPS