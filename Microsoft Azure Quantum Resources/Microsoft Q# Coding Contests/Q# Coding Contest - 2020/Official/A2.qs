namespace Solution {
    open Microsoft.Quantum.Intrinsic;

    operation Solve(unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        mutable ans = -1;
        
        using (qs = Qubit[4]){
            X(qs[0]);
            X(qs[3]);
            
            unitary(qs[0..1]);
            unitary(qs[2..3]);
 
            let q0 = M(qs[0]);
            let q1 = M(qs[1]);
            let q2 = M(qs[2]);
            let q3 = M(qs[3]);
            if(q0 == One and q1 == Zero and q2 == Zero and q3 == One){
                set ans = 0;
            }
            if(q0 == One and q1 == One and q2 == Zero and q3 == One){
                set ans = 1;
            }
            if(q0 == One and q1 == Zero and q2 == One and q3 == One){
                set ans = 2;
            }
            if(q0 == Zero and q1 == One and q2 == One and q3 == Zero){
                set ans = 3;
            }
            ResetAll(qs);
        }
        return ans;
}
}
