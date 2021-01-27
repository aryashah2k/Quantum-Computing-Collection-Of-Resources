namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    
    operation buildW (qs : Qubit[]) : Unit is Adj + Ctl {
        body {
            let N = Length(qs);
            Ry(2.0*ArcSin(Sqrt(1.0/(IntAsDouble(N)))), qs[0]);
            if (N > 1){
                ((ControlledOnInt)(0, buildW))([qs[0]], qs[1...]);
            }
        }
        adjoint auto;
    }
    
    operation andOracle (x : Qubit[], y : Qubit) : Unit {
        body {
            (Controlled X)(x, y);
        }
        adjoint auto;
    }
    
    operation Solve (qs : Qubit[]) : Int {
        R1(-2.0*(PI()/3.0), qs[1]);
        R1(-4.0*(PI()/3.0), qs[2]);
        
        Adjoint buildW(qs);
        
        mutable ans = 1;
        
        using (q = Qubit()){
            ApplyToEachA(X, qs);
            andOracle(qs, q);
            if (M(q) == One){
                set ans = 0;
                X(q);
            }
        }
        
        return ans;
    }
}
