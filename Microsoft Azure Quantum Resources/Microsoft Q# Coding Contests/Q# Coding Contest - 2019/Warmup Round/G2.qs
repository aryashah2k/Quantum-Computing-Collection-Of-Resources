namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (x : Qubit[], y : Qubit) : Unit {
        body (...) {
            ApplyToEachA(X, x);
            (Controlled X)(x, y);
            ApplyToEachA(X, x);
            X(y);
        }
        adjoint auto;
    }
}
