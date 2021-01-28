namespace Solution {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Preparation;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
    
    
    operation Inc (register : LittleEndian) : Unit is Adj+Ctl {
        let arr = register!;
        if (Length(arr) > 0) {
            Controlled Inc([arr[0]], LittleEndian(arr[1..Length(arr)-1]));
            X(arr[0]);
        }
    }
    
    operation Dec (register : LittleEndian) : Unit is Adj+Ctl {
        let arr = register!;
        if (Length(arr) > 0) {
            X(arr[0]);
            Controlled Dec([arr[0]], LittleEndian(arr[1..Length(arr)-1]));
        }
    }
    
    operation Solve(inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        using (q = Qubit[4]){
            for (i in 0..Length(inputs)-1){
                Controlled Inc([inputs[i]], LittleEndian(q));
            }
            (ControlledOnInt(Length(inputs)/2, X))(q, output);
            for (i in 0..Length(inputs)-1){
                Controlled Dec([inputs[i]], LittleEndian(q));
            }
        }
    }
}
