namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Preparation;
    
    operation Solve(unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        mutable ans = 1;
        using (q  = Qubit[2]){
            unitary(q);
            if (M(q[1]) == One){
                set ans = 0;
            }
            ResetAll(q);
            }
        return ans;
    }
}
