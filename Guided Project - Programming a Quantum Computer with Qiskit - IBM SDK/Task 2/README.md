## Task 2 - Qubits, Bloch Sphere and Basis States

# Learning objective: Manipulate Qubits and Represent them on Bloch Sphere

Welcome back, in this section we will set up the environment and start programming in quantum language, first we need to install Qiskit, which is a software development kit from IBM.

As you might guess a quantum computer hardware is complicated so when we try to write code for it, we might need different levels of abstraction in our programming language, just like classical computer programming which you can access directly to memory, ports and cpu registers with language like assembly but in higher level languages you do not need to access directly to them.

There are Four different modules to use in Qiskit, they are called Terra, Ear, Ignace and Aqua used for working with quantum computer in different levels of abstraction from pulses, circuits all the way up to optimized algorithms. We will use Aer component for simulating quantum circuits on our local computer.

We check whether Qiskit is installed correctly by typing following commands:

![Task 2 Snip 1](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%202/assets/Task%202%20Snip%201.png)

Qubits are the basic unit of computation in a quantum computer, we denote a Qubit state as a two dimensional vector with two complex amplitudes, you can think of qubit as a spin state of an electron, when the spin of electron is up we represent it with ket vector |0> and when the spin is up we represent it with ket vector |1>.

We can also plot the spin state in so called Bloch sphere:

![Task 2 Snip 2](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%202/assets/Task%202%20Snip%202.png)

An electron can be in state plus or minus which is a superposition of up and down state. 

As you see we can visualize these two states on Bloch Sphere too. Below you can see how we can prepare state of a two qubit system by using tensor product.
 
**Quiz Question: What is the inner product of bra vector |-2 4> and ket vector |-1 3>?**

**14** *Answer*

10

7
