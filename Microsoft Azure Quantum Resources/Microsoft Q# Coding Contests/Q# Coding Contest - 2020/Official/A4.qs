namespace Solution {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Preparation;
    open Microsoft.Quantum.Intrinsic;

    operation Solve (unitary : ((Double, Qubit) => Unit is Adj+Ctl)) : Int {
        mutable ans = 0;
        using (q = Qubit[2]){
           ApplyToEachA(H, q);
           Controlled unitary([q[0]], (2.0*PI(), q[1]));
           ApplyToEachA(H, q);
           if (M(q[0]) == Zero){
               set ans = 1;
           }
           ResetAll(q);
        }
        return ans;
    }
}
