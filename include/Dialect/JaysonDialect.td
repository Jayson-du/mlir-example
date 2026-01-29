#ifndef JAYSON_DIALECT
#define JAYSON_DIALECT

include "mlir/IR/DialectBase.td"

def Jayson_Dialect : Dialect {
  let name = "jayson";

  let cppNamespace = "::mlir::jayson";

  let summary = "The Jayson dialect in MLIR";

  let description = [{
    The Jayson dialect is a custom MLIR dialect for demonstration purposes.
  }];

  let dependentDialects = [
    "arith::ArithDialect",
    "math::MathDialect",
    "scf::SCFDialect",
    "cf::ControlFlowDialect",
    "ub::UBDialect"
  ];

  // let extraClassDeclarations = [{}];

  // let discardableAttrs = (ins
  //    "::mlir::IntegerAttr":$num_stages,
  //    "::mlir::IntegerAttr":$latency,
  //    "::mlir::IntegerAttr":$self_latency
  // );

  // let hasConstantMaterializer = 1;
  // let useDefaultTypePrinterParser = 1;
  // let usePropertiesForAttributes = 1;
}

#endif
