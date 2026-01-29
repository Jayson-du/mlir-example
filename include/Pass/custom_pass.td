#ifndef CUSTOM_PASS_TD
#define CUSTOM_PASS_TD

include "mlir/Pass/PassBase.td"

def CustomOptimizationPass : Pass<"custom-optimization-pass"> {
  let summary =
      "A custom optimization pass that performs specific transformations.";
  let description = [{
      This pass applies a series of custom optimizations to improve performance
          and reduce resource usage in the intermediate representation.}];
}

#endif
