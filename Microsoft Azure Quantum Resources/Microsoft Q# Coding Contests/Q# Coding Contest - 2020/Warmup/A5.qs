namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Preparation;
    
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable ans = 0;
        using (qs = Qubit[2]){
            ApplyToEach(H, qs);
            Controlled unitary([qs[0]], qs[1]);
           	Controlled Z([qs[0]], qs[1]);
           	ApplyToEach(H, qs);
            if(M(qs[0]) == One){
                set ans = 1;
            }
            ResetAll(qs);
        }
        return ans;
    }
}
