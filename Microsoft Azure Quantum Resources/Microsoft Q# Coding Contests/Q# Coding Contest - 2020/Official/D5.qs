namespace Solution {
  open Microsoft.Quantum.MachineLearning;
  open Microsoft.Quantum.Intrinsic;
  open Microsoft.Quantum.Canon;
  open Microsoft.Quantum.Math;
  open Microsoft.Quantum.Diagnostics;
  open Microsoft.Quantum.Measurement;
  open Microsoft.Quantum.Convert;
  open Microsoft.Quantum.Preparation;
  open Microsoft.Quantum.Arithmetic;
 
 
  function ClassifierStructure() : ControlledRotation[] {
    return [
            ControlledRotation((0, new Int[0]), PauliX, 0),
            ControlledRotation((1, new Int[1]), PauliX, 0),
            ControlledRotation((0, [1]), PauliY, 1),
            ControlledRotation((1, [0]), PauliY, 2),
            ControlledRotation((0, new Int[0]), PauliX, 3),
            ControlledRotation((1, new Int[1]), PauliX, 3),
            ControlledRotation((0, [1]), PauliY, 4),
            ControlledRotation((1, [0]), PauliY, 5)
    ];
  }
 
  operation Solve () : ((Int, Double[]), ControlledRotation[], (Double[], Double)) {
    let tmp = [-2.1218];
    return ((1, tmp), ClassifierStructure(), ([-2.12255887329871297, 0.5387, 1.0, -2.6698787, 2.1, 2.0], 0.07535782986012077));
 
  }
}


