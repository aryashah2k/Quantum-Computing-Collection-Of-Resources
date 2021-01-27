namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Unit {
        H(qs[0]);
        for (i in 2..Length(qs)-1){
            H(qs[i]);
        }
    }
}
