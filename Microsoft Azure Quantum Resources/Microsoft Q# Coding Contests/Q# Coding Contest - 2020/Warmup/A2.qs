namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Preparation;
    
    operation Solve(unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable ans = 0;
        using (q  = Qubit()){
          H(q);
          unitary(q);
          H(q);
          set ans = M(q)==One ? 1 | 0;
          Reset(q);
        }
        return ans;
    }
    
 
}
