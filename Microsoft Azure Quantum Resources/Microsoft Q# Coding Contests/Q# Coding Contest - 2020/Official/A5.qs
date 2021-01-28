namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Preparation;
    open Microsoft.Quantum.Arithmetic;
 
    operation Solve(theta : Double, unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        mutable ans = 0;
        mutable tmp = 0;
        for(i in 0..45){
            using(q = Qubit()){
                for(j in 0..i){
                    unitary(q);
                }
                if (M(q) == One){
                    set tmp = 1;
                }
                else {
                    set tmp = 0;
                }
                Reset(q);
            }
            if(tmp == 1){
                set ans = 1;
            }
        }
        return ans;
    }
}
