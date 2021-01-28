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
            ControlledRotation((0, new Int[0]), PauliZ, 1)
        ];
    }
    
    operation Solve () : (ControlledRotation[], (Double[], Double)) {
    
       return (ClassifierStructure(), ([3.174499999999999], 0.0065281292966165696));
 
    }
}
