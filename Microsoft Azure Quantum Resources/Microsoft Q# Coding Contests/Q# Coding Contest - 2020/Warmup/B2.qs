namespace Solution {
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
 
    operation Solve(register : LittleEndian) : Unit is Adj + Ctl {
    	X(register![0]);
    	for (i in 1..Length(register!)-1) {
    		Controlled X(register![0..i-1], register![i]);
    	}
    }
}
