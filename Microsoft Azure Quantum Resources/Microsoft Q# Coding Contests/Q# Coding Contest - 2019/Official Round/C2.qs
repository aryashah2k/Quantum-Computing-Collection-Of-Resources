namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation build (x : Qubit[], p : Int, rsp : Qubit) : Unit is Adj {
        for (i in 0..Length(x)-p-1){
            CNOT(x[i+p], x[i]);
            X(x[i]);
        }
        Controlled X(x[0..Length(x)-p-1], rsp);
        for (i in Length(x)-p-1..-1..0){
            X(x[i]);
            CNOT(x[i+p], x[i]);
        }
    }
    
    operation Solve (x : Qubit[], y : Qubit) : Unit {
        body (...) {
            let N = Length(x);
            using (qs = Qubit[N-1]){
                for (i in 1..N-1){
                    build(x, i, qs[i-1]);
                }
                X(y);
                (ControlledOnInt(0, X))(qs, y);
                for (i in 1..N-1){
                    build(x, i, qs[i-1]);
                }
            }
        }
        adjoint auto;
    }
}
