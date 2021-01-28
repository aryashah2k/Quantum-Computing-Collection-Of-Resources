namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve(register : LittleEndian) : Unit is Adj + Ctl {
        X(register![0]);
        for (i in 1..Length(register!)-1) {
            for (j in 0..i-1){
                X(register![j]);
            }
            
            Controlled X(register![0..i-1], register![i]);
            
            for (j in 0..i-1){
                X(register![j]);
            }
        }
    }
}
