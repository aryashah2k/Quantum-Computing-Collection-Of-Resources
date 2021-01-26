namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
 
    operation Solve (q : Qubit) : Int
    {
        body
        {
            let aux = RandomInt(2);
            mutable ans = -1;
            
            if (aux == 1){
                if (M(q) == One){
                    set ans = 1;
                }
            }
            else {
                H(q);
                if (M(q) == One){
                    set ans = 0;
                }
            }
            return ans;
        }
    }
}

