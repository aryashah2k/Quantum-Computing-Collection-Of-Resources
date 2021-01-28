namespace Solution {
  open Microsoft.Quantum.Convert;
  open Microsoft.Quantum.Intrinsic;
  open Microsoft.Quantum.Canon;
  open Microsoft.Quantum.Arrays;
  open Microsoft.Quantum.MachineLearning;
  open Microsoft.Quantum.Math;
 
 
  function ClassifierStructure() : ControlledRotation[] {
    return [
      ControlledRotation((0, [1]), PauliY, 0),
      ControlledRotation((1, [0]), PauliY, 1)
    ];
  }
 
  operation Solve () : ((Int, Double[]), ControlledRotation[], (Double[], Double)) {
    let tmp = [1.0];
    return ((1, tmp), ClassifierStructure(), ([2.09439510239,3.14159265359], 0.285900000000000));
 
  }
}
