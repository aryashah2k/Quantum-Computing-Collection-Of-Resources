namespace Solution {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Preparation;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.MachineLearning;
    open Microsoft.Quantum.Intrinsic;
 
        function ClassifierStructure() : ControlledRotation[] {
            return [
                ControlledRotation((0, new Int[0]), PauliX, 0),
                ControlledRotation((1, new Int[1]), PauliX, 0),
                ControlledRotation((0, [1]), PauliY, 1),
                ControlledRotation((1, [0]), PauliY, 2)
            ];
          }
         
          operation Solve () : ((Int, Double[]), ControlledRotation[], (Double[], Double)) {
            let tmp = [1.0];
            return ((1, tmp), ClassifierStructure(), ([0.0,0.0,1.0], 0.18093932427606987));
         
          }
    
}
