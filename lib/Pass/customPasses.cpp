#include "mlir/Pass/Pass.h"
#include "mlir/Pass/PassRegistry.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Support/raw_ostream.h"

#define GEN_PASS_DEF_CUSTOMOPTIMIZATIONPASS
#include "Pass/customPasses.h.inc"

using namespace mlir;
using namespace llvm;

struct CustomPassLib
    : public ::impl::CustomOptimizationPassBase<CustomPassLib> {

  virtual void runOnOperation() final {
    // llvm::DenseSet<Operation *> visited;
    // getOperation()->walk([&](toy::ReturnOp op) { visitAll(visited, op); });
    // llvm::SmallVector<Operation *> opToRemove;
    // getOperation().walk([&](Operation *op) {
    //   if (op == getOperation())
    //     return;
    //   if (!visited.contains(op))
    //     opToRemove.push_back(op);
    // });
    // for (auto v : reverse(opToRemove)) {
    //   v->erase();
    // }
  }
};

std::unique_ptr<mlir::Pass> createCustomPass() {
  return std::make_unique<CustomPassLib>();
}
