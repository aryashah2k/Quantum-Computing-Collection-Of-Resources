## Task 4: Multiple Qubits and Entanglement

# Learning objective: Describe multiple Qubits States and do operation on them.

We have seen some interesting effects with single qubits and single qubit gates, but the true power of quantum computing is realized through the interactions between qubits. 

In this section we will introduce multiple qubit gates and explore the interesting behaviors of multi-qubit systems. 

We have seen how we can represent the state of a qubit using a 2D-vector, now we will see how we can represent the state of multiple qubits. First we import everything from qiskit:

![Task 4 Snip 1](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%204/assets/Task%204%20Snip%201.png)

To describe the state of two qubits requires four complex amplitudes. 

We store these amplitudes in a 4D-vector like so. Let’s create a quantum circuit with three quantum register and apply Hadamard gate like previous section circuit, each qubit is in |+> state so we should see the following state (in notebook), Let’s see the result of simulaton:

![Task 4 Snip 2](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%204/assets/Task%204%20Snip%202.png)

As we see after running the cell we get the exact same result.

Okay next we create a Quantum circuit with two register and apply Hadamard gate on first qubit and X-gate on second qubit, we can represent the simultaneous operations (H & X) using their tensor product, it looks like this (in notebook).

C-NOT gate is a conditional gate that performs an X-gate on the second qubit (target), if the state of the first qubit (control) is |1>, this is how we apply a C-NOT gate:

![Task 4 Snip 3](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%204/assets/Task%204%20Snip%203.png)

We can use the classical truth table to understand C-Not gate.

Let’s now see how C-Not gate acts on a qubit in superposition:

![Task 4 Snip 4](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%204/assets/Task%204%20Snip%204.png)

As expected, this produces this state (in notebook), and let’s see what happens when we apply the CNOT gate:

![Task 4 Snip 5](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%204/assets/Task%204%20Snip%205.png)

Let’s see the results:

![Task 4 Snip 6](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%204/assets/Task%204%20Snip%206.png)

This state cannot be written as a tensor product of two single qubit state and is called bell states.

Bell states are entangled which means there is a high correlation between their outcome and measuring one qubit state reveal other qubit states. This is what Einstein called spooky actin in distance, which means if this qubit is light year away they still can interact on each other.

**Quiz Questions: Which state is not Bell state?**

|00> + |11>

|01>+|10>

**|11>-|11>** *Answer *
