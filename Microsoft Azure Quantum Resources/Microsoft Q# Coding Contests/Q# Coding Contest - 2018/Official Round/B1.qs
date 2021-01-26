namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    
    operation andOracle (x : Qubit[], y : Qubit) : Unit {
    body {
        (Controlled X)(x, y);
    }
    adjoint auto;
    }


    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            mutable ans = 1;
        
            using (q = Qubit()){
                ApplyToEachA(X, qs);
                andOracle(qs, q);
                
                if (M(q) == One){
                    X(q);
                    set ans = 0;
                }
                
                ApplyToEachA(X, qs);
            }
            return ans;
        }
    }
}
