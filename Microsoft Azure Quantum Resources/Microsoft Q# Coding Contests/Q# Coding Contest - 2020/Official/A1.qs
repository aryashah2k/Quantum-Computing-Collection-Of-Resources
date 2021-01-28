namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        mutable ans = 0;
        using (q = Qubit[2]){
            X(q[0]);
            X(q[1]);
            unitary(q);
            if (M(q[0]) == Zero){
                set ans = 1;
            }
            ResetAll(q);
        }
        return ans;
    }
}
