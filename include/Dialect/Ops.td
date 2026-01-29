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

  // 会多生成一个 `static getCanonicalizationPatterns` 静态方法
  // let hasCanonicalizer = 1;

  // 会多生成一个 `static getCanonicalizationPatterns` 和
  // `static canonicalize`静态方法
  // 并且会生成一个
  // void LoadOp::getCanonicalizationPatterns(::mlir::RewritePatternSet &results, ::mlir::MLIRContext *context) {
  //  results.add(canonicalize);
  // }, 方法自动注册到上面的静态方法
  // `static canonicalize` 方法需要手动实现
  // let hasCanonicalizeMethod = 1;

  // 生成一个 build 方法
  // builders 字段指定 build 方法的参数和类型
  // 如 static void build(::mlir::OpBuilder &odsBuilder, ::mlir::OperationState &odsState, ArrayRef<int64_t> shape, Value src, bool allowReorder = false);
  let builders = [
    // 生成
    // static void build(::mlir::OpBuilder &odsBuilder, ::mlir::OperationState &odsState, ArrayRef<int64_t> shape, Value src, bool allowReorder = false);
    // 没有加实现, 需要自己手动实现
    OpBuilder<(ins "ArrayRef<int64_t>":$shape, "Value":$src,
                     CArg<"bool", "false">:$allowReorder)>,

    // 生成
    // static void build(::mlir::OpBuilder &odsBuilder, ::mlir::OperationState &odsState, SymbolRefAttr callee, TypeRange results, ValueRange operands = {});
    // 在td中添加了实现, 不需要自己手动实现
    OpBuilder<(ins "SymbolRefAttr":$callee, "TypeRange":$results,
      CArg<"ValueRange", "{}">:$operands), [{
      $_state.addOperands(operands);
      $_state.addAttribute("callee", callee);
      $_state.addTypes(results);
    }]>,
  ];

}

#endif // JAYSON_OPS