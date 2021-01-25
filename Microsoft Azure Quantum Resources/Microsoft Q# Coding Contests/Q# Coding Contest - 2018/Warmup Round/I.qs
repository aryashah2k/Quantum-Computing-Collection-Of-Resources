namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Bool
    {
        mutable var = true;
        using (q = Qubit[N+1]){
            X(q[N]);
            ApplyToEachA(H, q);
            Uf(q[0..N-1], q[N]);
            ApplyToEachA(H, q);
            
            for (i in 0..N-1){
                if (M(q[i]) == One){
                   set var = false;
                }
            }
            
            ResetAll(q);
        }
        
        return var;
    }
}
