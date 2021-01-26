namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (N : Int, Uf : ((Qubit[], Qubit) => ())) : Int[]
    {
        body
        {
            mutable ans = new Int[N];
        
            using (qs = Qubit[N+1]){
                Uf(qs[0..N-1], qs[N]);
                
                if (N%2 == 1){
                    X(qs[N]);
                }
                
                if (M(qs[N]) == One){
                    set ans w/= 0 <- 1;
                }
                
                ResetAll(qs);
            }
            
            return ans;
        }
    }
}
