namespace Solution {
        open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Preparation;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
    
    operation unitary1(qs : Qubit) : Unit is Adj+Ctl {
        X(qs);
        Z(qs);
        X(qs);
        X(qs);
    }
    
    operation unitary11(qs : Qubit) : Unit is Adj+Ctl {
        Z(qs);
        X(qs);
    }
    
    operation unitary0(qs : Qubit) : Unit is Adj+Ctl {
        X(qs);
        Y(qs);
        X(qs);
    }
    
    operation unitary00(qs : Qubit) : Unit is Adj+Ctl {
        Y(qs);
    }

    operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
     mutable aux=0;
    mutable aux1=0;
    using (qs = Qubit[2]){
        ApplyToEachA(H, qs);
        Controlled unitary([qs[0]], qs[1]); 
        Controlled X([qs[0]], qs[1]);  
        Controlled unitary([qs[0]], qs[1]);
        ApplyToEachA(H, qs);
        if (M(qs[0]) == One){
            set aux = 1;
        }
        ResetAll(qs);
    }
    if(aux == 0){
        using (qs  = Qubit[2]){
            ApplyToEachA(H, qs);
            Controlled unitary([qs[0]], qs[1]);
            Controlled Z([qs[0]], qs[1]);
            ApplyToEachA(H, qs);   
            if(M(qs[0]) == One){
                set aux1 = 1;
            }
            ResetAll(qs);
        }
    }
    else{
        using (qs  = Qubit[2]){
            ApplyToEachA(H, qs);
            Controlled unitary([qs[0]], qs[1]);
            Controlled S(qs[0..0], qs[1]);
            Controlled X(qs[0..0], qs[1]);
            Controlled S(qs[0..0], qs[1]);
            Controlled Z(qs[0..0], qs[1]);
            ApplyToEachA(H, qs);
            if(M(qs[0]) == One){
                set aux1 = 1;
            }
            ResetAll(qs);
        }
    }
    if(aux == 0 and aux1 == 1){
        return 3;
    }
    if(aux == 0 and aux1 == 0){
        return 1;
    }
    if(aux == 1 and aux1 == 1){
        return 0;
    }
    return 2;
}
}
