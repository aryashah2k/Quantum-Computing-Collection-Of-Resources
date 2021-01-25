namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
  operation Solve (qs : Qubit[]) : Int
    {
        CNOT(qs[0], qs[1]);
        H(qs[0]);
        let v1 = M(qs[0]) == One ? 1 | 0;
        let v2 = M(qs[1]) == One ? 1 | 0;
        
        return 2*v2 + v1;
    }
}
