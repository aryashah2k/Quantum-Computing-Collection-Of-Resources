namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Diagnostics;
 
 
//Puts a state |000...0> into the GHZ state |100..0> + |010..0> + ... |000..1>/sqrtN
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
 
    operation Solve (qs : Qubit[]) : ()
    {
        body
        {
            buildW(qs);
        }
    }
}
