namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Int[]
    {
        body
        {   
            mutable ans = new Int[N];
            using (qs = Qubit[N+1]){
                X(qs[N]);
                ApplyToEachA(H, qs);
                Uf(qs[0..N-1], qs[N]);
                ApplyToEachA(H, qs);
                X(qs[N]);
                for (i in 0..N-1){
                    if (M(qs[i]) == One){
                        set ans w/= i <- 1;
                    }
                }
                ResetAll(qs);
            }
            return ans;
        }
    }
}
