namespace Superposition {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Intrinsic;
    

    @EntryPoint()
    operation HelloQ() : Unit {
        for( i in 0..10 )
        {
            using( q = Qubit() )
            {
                H(q);

                let b = M(q);

                Message( BoolAsString( b == One ) );

                Reset(q);
            }
        }
    }
}