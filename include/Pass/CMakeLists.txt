set(LLVM_TARGET_DEFINITIONS custom.td)

mlir_tablegen(customPasses.h.inc -gen-pass-decls DEPENDS ${LLVM_TARGET_DEFINITIONS})

add_public_tablegen_target(MLIRCustomPassesIncGen)