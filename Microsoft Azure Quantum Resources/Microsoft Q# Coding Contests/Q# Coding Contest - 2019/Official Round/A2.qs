namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (qs : Qubit[], bits : Bool[][]) : Unit {
        using (aux = Qubit[2]){
            H(aux[0]);
            H(aux[1]);
            
            for (i in 0..3){
                for (j in 0..Length(qs)-1){
                    if (bits[i][j]){
                        (ControlledOnInt(i, X))(aux, qs[j]);
                    }
                }
            }
            
            for (i in 0..3){
                if (i%2 == 1){
                    (ControlledOnBitString(bits[i], X))(qs, aux[0]);
                }
                if (i/2 == 1){
                    (ControlledOnBitString(bits[i], X))(qs, aux[1]);
                }
            }
        }
    }
}
