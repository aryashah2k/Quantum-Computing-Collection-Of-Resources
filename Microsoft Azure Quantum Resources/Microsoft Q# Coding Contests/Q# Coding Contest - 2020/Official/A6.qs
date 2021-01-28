namespace Solution {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Preparation;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
    
    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable t = -1;
        using (qs = Qubit[2]){
            ApplyToEachA(H, qs);
            X(qs[1]);
            Controlled Z([qs[0]], qs[1]);
            X(qs[1]);
            
            //I(qs[1]);   ----> 1
            //X(qs[1]);   ----> 3
            //Z(qs[1]);   ----> 0
            //Y(qs[1]);   ----> 2
            unitary(qs[1]);
            
            ApplyToEachA(X, qs);
            Controlled Z([qs[1]], qs[0]);
            ApplyToEachA(X, qs);
            
            ApplyToEachA(H, qs);
            //DumpMachine();
            
            let m1 = M(qs[0]) == One ? 1 | 0;
            let m2 = M(qs[1]) == One ? 1 | 0;
            set t = (2*m1)+m2;
            
            ResetAll(qs);
        }
        //Message($"{t}");
            
        if (t == 0){
            return 3;
        }
        elif (t == 1){
            return 0;
        }
        elif (t == 2){
            return 2;
        }
        return 1;
    }
}
