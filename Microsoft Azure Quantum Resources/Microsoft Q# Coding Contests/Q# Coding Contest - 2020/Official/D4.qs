namespace Solution {
      open Microsoft.Quantum.Convert;
      open Microsoft.Quantum.Intrinsic;
      open Microsoft.Quantum.Canon;
      open Microsoft.Quantum.Arrays;
      open Microsoft.Quantum.MachineLearning;
      open Microsoft.Quantum.Math;
     
     
      function ClassifierStructure() : ControlledRotation[] {
        return [
            ControlledRotation((0, new Int[0]), PauliX, 0),
            ControlledRotation((1, new Int[1]), PauliX, 0),
            ControlledRotation((0, [1]), PauliY, 1),
            ControlledRotation((1, [0]), PauliY, 2)
        ];
      }
     
      operation Solve () : ((Int, Double[]), ControlledRotation[], (Double[], Double)) {
        let tmp = [0.523103];
        return ((1, tmp), ClassifierStructure(), ([12.63642368, 1.5, 0.0], 0.0741223437941672));
     
      }
}
