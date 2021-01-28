namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation Solve(unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable ans = -1;
        using (q = Qubit()){
            X(q);
            unitary(q);
            X(q);
            unitary(q);
 
            if (M(q) == Zero){
                set ans = 1;
            }
            else {
                set ans = 0;
            }
    
            Reset(q);
        }
        return ans;
    }
}
