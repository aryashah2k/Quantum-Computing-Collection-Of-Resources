namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Unit {
        let n = Length(qs);
    
        X(qs[n-1]);
        for(i in 1..n-1){
            CNOT(qs[n-1],qs[n-1-i]);
        }
        X(qs[n-1]);
    
        for(i in 1..n-1){
            Controlled H([qs[n-1]],qs[n-1-i]);
        }
    }
}
