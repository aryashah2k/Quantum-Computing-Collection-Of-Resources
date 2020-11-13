## Task 3: Quantum Gates and Circuits

# Learning objective: Understand Quantum Gates and build Quantum Circuits.

Welcome to the third section, In this section we will cover gates, the operations that change a qubit between these states. Pauli matrices can represent some very commonly used quantum gates.

We have a look at Pauli matrices.(In the Task 3 Notebook)

The first Quantum gate you get to know is X-gate, to see the effect a gate has on a qubit, we simply multiply the qubit’s state vector by the gate, the X-gate switches the amplitude of the state vector as you see. 

In Qiskit we can create a circuit to verify this:

![Task 3 Snip 1](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%203/assets/Task%203%20Snip%201.png)

It’s like classical NOT gate, here it reverses the direction of the state vector.

Similar to the X-gate, the Y & Z Pauli matrices also act as the Y & Z-gates in our quantum circuits, And, unsurprisingly, they also respectively perform rotations by pi around the y and z-axis of the Bloch sphere.

The Hadamard gate (H-gate) is a fundamental quantum gate. 

It allows us to move away from the poles of the Bloch sphere and create a superposition of |0> and |1> , It has the matrix form represented in notebook. Let’s create a quantum circuit with three quantum register and apply Hadamard gate:

![Task 3 Snip 2](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%203/assets/Task%203%20Snip%202.png)

Next comes the I-gate (aka ‘Id-gate’ or ‘Identity gate’). This is simply a gate that does nothing. 

Its matrix is the identity matrix, Applying the identity gate anywhere in your circuit should have no effect on the qubit state, so it’s interesting this is even considered a gate. There are two main reasons behind this, one is that it is often used in calculations, for example: proving the X-gate is its own inverse. 

The second, is that it is often useful when considering real hardware to specify a ‘do-nothing’ or ‘none’ operation. 

In the next task you see other gates and how they operate on multiple qubits.

**Quiz Questions: What will be the result of applying Hadamard gate on state |1>?**

|+>

(|0> + |1>)/sqrt(2)

**|->** *Answer *
