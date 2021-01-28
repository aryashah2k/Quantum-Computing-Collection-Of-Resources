namespace Solution {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Preparation;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Extensions.Convert;
    
    operation Reverse(x : Qubit[]) : Unit is Adj+Ctl {
        let N = Length(x);
        for (i in 0 .. N/2-1) {
            SWAP(x[i], x[N-1-i]);
        }
    }
    
    operation myQFT(x : Qubit[], p : Int) : Unit is Adj+Ctl {
        let n = Length(x);
        for (i in n-1..-1..0) {
            H(x[i]);
            for (j in i-1..-1..0) {
                let theta = (2.0*PI())/(ToDouble(1 <<< i-j+1)*ToDouble(p));
                Controlled R1([x[j]], (theta, x[i]));
            }
        }
        Reverse (x);
    }
    
    operation Solve (p : Int, inputRegister : LittleEndian) : Unit is Adj+Ctl {
        let qubitArray = inputRegister!;
        using (aux = Qubit[2]){
            ApplyToEachCA(H, aux);
            Controlled myQFT([aux[0]], (qubitArray, 1));
            Controlled myQFT([aux[1]], (qubitArray, 1));
            Controlled myQFT([aux[1]], (qubitArray, 1));
            Adjoint myQFT(aux, 1);
            R1(PI()/(2.0*ToDouble(p)), aux[0]);
            R1(PI()/(ToDouble(p)), aux[1]);
            myQFT(aux, 1);
            Controlled Adjoint myQFT([aux[1]], (qubitArray, 1));
            Controlled Adjoint myQFT([aux[1]], (qubitArray, 1));
            Controlled Adjoint myQFT([aux[0]], (qubitArray, 1));
            ApplyToEachCA(H, aux);
        }
    }
}
