namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (x : Qubit[], y : Qubit) : Unit {
        body (...) {
            let n = Length(x);
            
            using (aux = Qubit[n/2]){
                for (i in 0..(n/2)-1){
                        X(x[i]);
                        X(x[n-i-1]);
                        CCNOT(x[i], x[n-i-1], aux[i]);
                        X(x[i]);
                        X(x[n-i-1]);
                        CCNOT(x[i], x[n-i-1], aux[i]);
                }
        
                Controlled X(aux, y);
                    
                for (i in 0..(n/2)-1){
                        X(x[i]);
                        X(x[n-i-1]);
                        CCNOT(x[i], x[n-i-1], aux[i]);
                        X(x[i]);
                        X(x[n-i-1]);
                        CCNOT(x[i], x[n-i-1], aux[i]);
                }
            }
        }
        adjoint auto;
    }
}
