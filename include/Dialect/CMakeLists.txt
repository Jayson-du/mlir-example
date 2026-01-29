message ("*** Configuring MLIR Dialects *****")
set(MLIR_BINARY_DIR ${CMAKE_BINARY_DIR})

set(LLVM_TARGET_DEFINITIONS
  Ops.td
  )
mlir_tablegen(Ops.h.inc -gen-op-decls)
mlir_tablegen(Ops.cpp.inc -gen-op-defs)

add_public_tablegen_target(MLIRJaysonDialectIncGen)