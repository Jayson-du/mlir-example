include_directories(${CMAKE_BUILD_DIR}/include)

add_mlir_library(MLIRCustomPasses customPasses.cpp

DEPENDS
  MLIRCustomPassesIncGen
  MLIRJaysonDialectIncGen

LINK_LIBS PUBLIC
  MLIRIR
  MLIRPass
  MLIRSupport
  LLVMCore
  LLVMSupport
)