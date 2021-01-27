namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Unit is Adj+Ctl {
        let n = Length(qs);
        if (n > 1){
            for (i in 0..n-2){
                Controlled H([qs[n-1]], qs[i]);
            }
            (ControlledOnInt(0, Solve))([qs[n-1]], qs[0..n-2]);
        }
    }
}
