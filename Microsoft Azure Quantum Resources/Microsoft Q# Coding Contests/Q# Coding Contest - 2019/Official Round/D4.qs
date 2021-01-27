namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Unit {
        let n = Length(qs);
        ApplyToEachA((ControlledOnInt(0, X))([qs[n-1]], _), qs[0..n-2]);
        X(qs[0]);
        for (i in 1..Length(qs)-2) {
            Controlled X(qs[0..i-1], qs[i]);
        }
        H(qs[n-1]);
        ApplyToEachA((ControlledOnInt(1, X))([qs[n-1]], _), qs[0..n-2]);
    }
}
