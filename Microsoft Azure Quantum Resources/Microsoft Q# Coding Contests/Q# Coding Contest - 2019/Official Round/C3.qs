namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (x : Qubit[], y : Qubit) : Unit {
        body (...) {
            using (aux = Qubit[2]){
                X(aux[0]);
                X(aux[1]);
                
                for (i in 0..Length(x)-1){
                    CCNOT(x[i], aux[0], aux[1]);
                    CCNOT(x[i], aux[1], aux[0]);
                }
                
                CCNOT(aux[0], aux[1], y);
                
                for (i in 0..Length(x)-1){
                    CCNOT(x[i], aux[1], aux[0]);
                    CCNOT(x[i], aux[0], aux[1]);
                }
                
                X(aux[0]);
                X(aux[1]);
            }
        }
        adjoint auto;
    }
}
