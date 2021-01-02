namespace chsh {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    
    @EntryPoint()
    operation SayHello() : Unit 
    {
        Message(" CHSH ");
        Message("------");

        let numberOfGames = 10000;
        mutable classicalWinCount = 0;
        mutable quantumWinCount = 0;

        for( i in 1..numberOfGames )
        {
            let bitForAlice = GetRandomBit();
            let bitForBob = GetRandomBit();

            let (classicalXorA, classicalXorB) = PlayClassic(bitForAlice, bitForBob);
            let (quantumXorA, quantumXorB) = PlayQuantum(bitForAlice, bitForBob);

            let bitProduct = BoolArrayAsInt([bitForAlice]) * BoolArrayAsInt([bitForBob]);
            
            let bitXorClassic = ModulusI(classicalXorA + classicalXorB, 2);
            if( bitProduct == bitXorClassic )
            {
                set classicalWinCount += 1;
            }

            let bitXorQuantum = ModulusI(quantumXorA + quantumXorB, 2);
            if( bitProduct == bitXorQuantum )
            {
                set quantumWinCount += 1;
            }
        }

        Message($"Classical win percentage: {(IntAsDouble(classicalWinCount) / IntAsDouble(numberOfGames))}");
        Message($"Quantum win percentage: {IntAsDouble(quantumWinCount) / IntAsDouble(numberOfGames)}");
    }

    operation GetRandomBit() : Bool
    {
        using( q = Qubit() )
        {
            H(q);
            let bit = MResetZ(q);
            return bit == One;
        }
    }

    operation PlayClassic( bitForAlice : Bool, bitForBob : Bool ) : (Int, Int)
    {
        if( GetRandomBit() )
        {
            return (0, 0);
        }
        else
        {
            return (1, 1);
        }
    }

    operation PlayQuantum( bitForAlice : Bool, bitForBob : Bool ) : (Int, Int)
    {
        using( (qubitForAlice, qubitForBob) = (Qubit(), Qubit()) )
        {
            H(qubitForAlice);
            CNOT(qubitForAlice, qubitForBob);

            if( GetRandomBit() )
            {
                let measuredForAlice = MeasureQubitForAlice(bitForAlice, qubitForAlice) == One ? 1 | 0;
                let measuredForBob = MeasureQubitForBob(bitForBob, qubitForBob) == One ? 1 | 0;
                return (measuredForAlice, measuredForBob);
            }
            else
            {
                let measuredForBob = MeasureQubitForBob(bitForBob, qubitForBob) == One ? 1 | 0;
                let measuredForAlice = MeasureQubitForAlice(bitForAlice, qubitForAlice) == One ? 1 | 0;
                return (measuredForAlice, measuredForBob);
            }
        }
    }

    operation MeasureQubitForAlice( bit : Bool, qubit : Qubit) : Result
    {
        if( bit )
        {
            return MResetX(qubit);
        }
        else
        {
            return MResetZ(qubit);
        }
    }

    operation MeasureQubitForBob( bit : Bool, qubit : Qubit) : Result
    {
        if( bit )
        {
            Ry(2.0 * PI() / 8.0, qubit);
        }
        else
        {
            Ry(-2.0 * PI() / 8.0, qubit);
        }

        return MResetZ(qubit);
    }
}