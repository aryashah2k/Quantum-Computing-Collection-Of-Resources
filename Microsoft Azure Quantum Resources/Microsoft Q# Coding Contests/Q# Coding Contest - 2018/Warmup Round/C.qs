namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arrays;
 
    operation Solve (qs : Qubit[]) : ()
    {
        H(qs[0]);
        
        for (i in Rest(qs)){
            CNOT(qs[0], i);
        }
    }
}

