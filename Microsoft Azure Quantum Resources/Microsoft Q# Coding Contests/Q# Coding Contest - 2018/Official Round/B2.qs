namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation andOracle (x : Qubit[], y : Qubit) : Unit {
        body {
            (Controlled X)(x, y);
        }
        adjoint auto;
    }
    
    operation buildGHZ (qs : Qubit[]) : Unit is Adj + Ctl {
        body {
            H(qs[0]);
            for (i in 1..Length(qs)-1){
                CNOT(qs[0], qs[i]);
            }
        }
        adjoint auto;
    }
 
 
    operation Solve (qs : Qubit[]) : Int
    {
        body
        {
            Adjoint buildGHZ(qs);
            
            mutable ans = 1;
            
            using (q = Qubit()){
                ApplyToEachA(X, qs);
                andOracle(qs, q);
                
                if (M(q)==One){
                    set ans = 0;
                    X(q);
                }
                
                ApplyToEachA(X, qs);
            }
            
            buildGHZ(qs);
        
            return ans;
        }
    }
}
