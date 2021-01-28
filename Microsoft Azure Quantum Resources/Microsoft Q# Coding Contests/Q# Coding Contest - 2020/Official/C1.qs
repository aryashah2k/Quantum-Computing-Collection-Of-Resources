namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Preparation;
    open Microsoft.Quantum.Arithmetic;
    
    operation Solve(qs : Qubit[]) : Unit {
        using (q = Qubit()) {
            repeat {
                ApplyToEachA(H, qs);
                Controlled X(qs, q);
            }
            until (M(q) == Zero)
            fixup {
                ResetAll(qs + [q]);
            }
        }
    }
}
