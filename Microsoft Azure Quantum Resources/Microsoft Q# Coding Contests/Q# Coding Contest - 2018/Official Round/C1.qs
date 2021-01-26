namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
 
    operation Solve (q : Qubit) : Int
    {
        body
        {
            Ry(0.25*PI(), q);
            if (M(q) == One){
                return 1;
            }
            return 0;
        }
    }
}
