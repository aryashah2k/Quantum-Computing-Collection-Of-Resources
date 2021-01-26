namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            H(qs[0]);
            H(qs[1]);
            
            let m1 = M(qs[1]) == One ? 1 | 0;
            let m2 = M(qs[0]) == One ? 1 | 0;
        
            return 2*m2 + m1;
        }
    }
}
