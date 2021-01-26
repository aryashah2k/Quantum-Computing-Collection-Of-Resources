namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : ()
    {
        using (q = Qubit()) {
        H(q);
        
        for (i in 0 .. Length(qs) - 1) {
            if (bits0[i]) {
                X(q);
                CNOT(q, qs[i]);
                X(q);
            }
            if (bits1[i]) {
                CNOT(q, qs[i]);
            }
        }
        
        
        (ControlledOnBitString(bits1, X))(qs, q);
        }
    }
}
