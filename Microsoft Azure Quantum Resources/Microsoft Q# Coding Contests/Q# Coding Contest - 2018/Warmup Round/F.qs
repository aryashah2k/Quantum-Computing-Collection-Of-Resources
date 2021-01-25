namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
  operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : Int
    {
        let N = Length(qs);
        
        for (i in 0..N-1){
            let m = M(qs[i]) == One ? 1 | 0;
            let b1 = bits1[i] == true ? 1 | 0;
            let b0 = bits0[i] == true ? 1 | 0;
            
            if (b1 != m) {
                return 0;
            }
            if (b0 != m) {
                return 1;
            }
        }
        return 0;
    }
}
