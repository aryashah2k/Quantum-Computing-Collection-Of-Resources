namespace Solution {
    open Microsoft.Quantum.Math;
open Microsoft.Quantum.Diagnostics;
open Microsoft.Quantum.Measurement;
open Microsoft.Quantum.Convert;
open Microsoft.Quantum.Preparation;
open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Arithmetic;
 
    operation findBal (x : Qubit[], y : Qubit, sum : Int, t : Int) : Unit is Adj+Ctl{
        let n = Length(x);
        if (n == 1){
            if (sum%3 == 0){
                X(x[0]);
                CNOT(x[0], y);
                X(x[0]);
            }
            elif ((sum+1)%3 == 0){
                CNOT(x[0], y);
            }
        }
        else {
            Controlled findBal([x[n-1]], (x[0..n-2], y, sum+2^(n-1), t));
            X(x[n-1]);
            Controlled findBal([x[n-1]], (x[0..n-2], y, sum, t));
            X(x[n-1]);
        }
    }
     
    operation Solve (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        let n = Length(inputs);
        Controlled findBal([inputs[n-1]], (inputs[0..n-2], output, 2^(n-1), n/2));
        X(inputs[n-1]);
        Controlled findBal([inputs[n-1]], (inputs[0..n-2], output, 0, n/2));
        X(inputs[n-1]);
    }
}
