namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
 
    operation Solve (q : Qubit) : Int
    {
        H(q);
        if (M(q) == Zero){
            return 1;
        }
        return -1;
    }
}
