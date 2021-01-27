namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[]) : Unit {
        func(qs);
    }
    operation func(qs : Qubit[]) : Unit{
        let N = Length(qs);
        mutable r = 1;
        for(i in 0..N-1){set r = 2*r;}
        for(i in 0..r-2){
            Controlled H(qs[1..N-1],qs[0]);
            increment(qs);
        }
        increment(qs);
    }
 
    operation increment(qs : Qubit[]) : Unit{
        body(...){
            for(i in (Length(qs)-1)..(-1)..1){
                Controlled X(qs[0..i-1], qs[i]);
            }
            X(qs[0]);
        }
        adjoint auto;
        controlled auto;
        controlled adjoint auto;
    }
}