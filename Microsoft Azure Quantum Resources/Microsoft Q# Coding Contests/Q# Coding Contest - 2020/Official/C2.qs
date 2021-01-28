namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Preparation;
    open Microsoft.Quantum.Intrinsic;
 
    operation Destruct1(qs : Qubit[]) : Unit {
        using (q = Qubit()) {
            repeat {
                ApplyToEachA(H, qs);
                for (i in 0..Length(qs)-1){
                    CNOT(qs[i], q);
                }
            }
            until (M(q) == One)
            fixup {
                ResetAll(qs + [q]);
            }
            Reset(q);
        }
    }
    
    operation Destruct2(qs : Qubit[]) : Unit {
        using (q = Qubit()) {
            repeat {
                ApplyToEachA(H, qs);
                for (i in 0..Length(qs)-1){
                    CNOT(qs[i], q);
                }
            }
            until (M(q) == Zero)
            fixup {
                ResetAll(qs + [q]);
            }
            Reset(q);
        }
    }
 
    operation Solve (qs : Qubit[], parity : Int) : Unit {
        if (parity == 0) {
            Destruct2(qs);
        }
        else{
            Destruct1(qs);
        }
    }
}
