namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Preparation;
    open Microsoft.Quantum.Arithmetic;
 
    operation Solve(qs : Qubit[]) : Unit{
	mutable m = 1;
	for(i in 0..100){
		if(m==1){
			H(qs[0]); H(qs[1]);
			using (q = Qubit()){
				(ControlledOnInt(0, X))(qs, q);
				set m = M(q)==One ? 1 | 0;
				if(m==1){X(q);}
				
			}
		}
	}
    }
}
