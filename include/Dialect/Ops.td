#ifndef JAYSON_OPS
#define JAYSON_OPS

include "mlir/IR/OpBase.td"
include "JaysonDialect.td"

class J_Op<string mnemonic, list<Trait> traits = []> :
    Op<Jayson_Dialect, mnemonic, traits>;

def J_LoadOp : J_Op<"jayson.load", []> {
  let summary = "Load operation in Jayson dialect";
  let arguments = (ins F64Tensor:$input
                        // Optional<AnyI32>:$vl,
                        // Optional<AnyI32>:$other
                  );
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
  // let builders = [
  //   // 生成
  //   // static void build(::mlir::OpBuilder &odsBuilder, ::mlir::OperationState &odsState, ArrayRef<int64_t> shape, Value src, bool allowReorder = false);
  //   // 没有加实现, 需要自己手动实现
  //   OpBuilder<(ins "ArrayRef<int64_t>":$shape, "Value":$src,
  //                    CArg<"bool", "false">:$allowReorder)>,

  //   // 生成
  //   // static void build(::mlir::OpBuilder &odsBuilder, ::mlir::OperationState &odsState, SymbolRefAttr callee, TypeRange results, ValueRange operands = {});
  //   // 在td中添加了实现, 不需要自己手动实现
  //   OpBuilder<(ins "SymbolRefAttr":$callee, "TypeRange":$results,
  //     CArg<"ValueRange", "{}">:$operands), [{
  //     $_state.addOperands(operands);
  //     $_state.addAttribute("callee", callee);
  //     $_state.addTypes(results);
  //   }]>,
  // ];

  // Region 是 MLIR 中的层次化结构，允许操作包含嵌套的 IR 代码
  // 每个 region 可以包含一个或多个基本块（blocks）
  // 常见约束类型：
  // AnyRegion: 任意区域
  // SizedRegion<n>: 包含指定数量基本块的区域
  // VariadicRegion: 可变数量的区域
  // let regions = (region SizedRegion<1>:$result);

  // 作用用于定义控制流中跳转目标, 指定操作可以跳转到的基本块
  // 特点: 主要用于终结符操作, 定义了控制流图(CFG)中的边
  // 约束类型: AnySuccessor(任意后继块), VariadicSuccessor(可变数量的后继块)
  // let successors = (successor AnySuccessor:$dest);

  // 是否有自定义的汇编格式
  // 需要手动实现 void print(OpAsmPrinter &p);
  // 和 static ParseResult parse(OpAsmParser &parser, OperationState &result);
  // let hasCustomAssemblyFormat = 1;

  let assemblyFormat = "$input attr-dict `:` type($input) `->` type($value)";

}

// ./Pass
// ./Transforms
// ./Target
// ./Reducer
// ./Dialect
// ./Bytecode
// ./Conversion
// ./Rewrite
// ./Interfaces
// ./IR



// - TritonAMDGPU_I32Enum
// - Gluon_Op
// - I32EnumAttrCase
// - TypedArrayAttrBase
// - I
// - TTI_Op
// - NativeCodeCallVoid
// - AttrDef
// - DeclareAttrInterfaceMethods
// - NVWS_Op
// - DistributedEncoding
// - TT_AMDGPU_Op
// - AnyTypeOf
// - TritonGPU_Attr
// - EnumAttr
// - PTG_TypeDef
// - DialectPlugin_Type
// - TypeInterface
// - OpInterface
// - TT_Op
// - NVWS_TypeDef
// - I32BitEnumAttr
// - Resource
// - NativeOpTrait
// - Pass
// - AttrOrTypeParameter
// - TTG_Op
// - RankedTensorOf
// - NVGPU_Op
// - Type
// - ArrayOfAttr
// - DialectPlugin_Op
// - TT_PtrOf
// - TTG_TypeDef
// - PTG_Op
// - TTNG_TypeDef
// - TritonAMDGPU_Attr
// - InferTypeOpAdaptorBase
// - I32EnumAttr
// - TritonTypeDef
// - LLVM_PointerInAddressSpace
// - TTNG_Op
// - Pat
// - AttrInterface
// - PT_Op
#endif // JAYSON_OPS