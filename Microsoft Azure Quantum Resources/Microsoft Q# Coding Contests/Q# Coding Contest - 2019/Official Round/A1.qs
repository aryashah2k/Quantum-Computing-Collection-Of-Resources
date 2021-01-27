namespace Solution {
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Math;
 
    operation Solve (qs : Qubit[]) : Unit {
        Ry(2.0*ArcSin(1.0/Sqrt(3.0)), qs[0]);
        (ControlledOnInt(0, H))([qs[0]], qs[1]);
    }
}
