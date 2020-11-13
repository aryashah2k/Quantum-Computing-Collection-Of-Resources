## Task 1 - Fundamentals of Quantum Computation

# Learning Objective: Do the basic operation on matrices and vectors and get familiar with BraKet notation

Hello and Welcome to this guided project.In this project we will be discovering exciting lands of quantum computation, a few years ago if you wanted to access a quantum computer, you had to be a researcher or part of a secret lab to get access to one. But now that’s not true anymore, quantum computers now exist and you can log in into cloud systems and run quantum codes. 

Currently there are different quantum software development packages like Cirq which is a google library for writing, designing and implementing quantum circuits and also TensorflowQuantum which is another google library for Quantum machine learning and Ocean which is D-Wave tool. There is another software development kit called Qiskit from IBM which we shall be using.
  
In the first part of this project we will get familiar with fundamentals of quantum computation including doing basic linear algebra operation in python and review some other concepts like complex numbers and tensor product. 

The unit of information in classical computer is bit which we perform operation on them through logical gates like AND, OR, NOT in quantum computing the unit of information is qubit which we do operations on them with quantum gates. We'll start diving deeper into the world of qubits. For this, we'll need some way of keeping track of what they are doing when we apply gates. The most powerful way to do this is to use the mathematical language of vectors and matrices.
 
So here is a code cell in the Jupyter notebook; it has lines of Python code and I can run it by hitting Shift-Enter, In the few first cells you can see how we do Basic operations like multiplication and summation in python.

Next we recall complex numbers a complex number is of the form “a+bi” which ‘a’ and ‘b’ are real numbers and ‘i’ is and imaginary number, In Python the imaginary unit ‘i’ is instead represented as ‘j’, and must always be written with a coefficient, here we define a few complex number and print their real and imaginary part then do basic arithmetic operation on them:

![Task 1 Snip 1](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%201/assets/Task%201%20Snip%201.png)

There is also the concept of Complex Conjugate which we calculate the complex conjugate of a complex number by changing the imaginary part sign, this is how we do it in python using Numpy:
 

![Task 1 Snip 2](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%201/assets/Task%201%20Snip%202.png)

The abslute value of a complex number is calculated by multiplying it with its complex conjugate, here is how we do it:

![Task 1 Snip 3](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%201/assets/Task%201%20Snip%203.png)

Matrices and Vectors form the foundation for quantum computing. Matrices are also called operators or quantum gates in the context of quantum computing. They can operate on a single qubit, or on many qubits simultaneously. Here is how we define row vectors and column vectors in python:

![Task 1 Snip 4](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%201/assets/Task%201%20Snip%204.png)
 
Row vectors in quantum mechanics are also called bra-vectors and Column vectors are also called ket-vectors in quantum mechanics.

The most important vectors we will encounter will be 2-dimensional complex vector which are of length 1. 

In this section we will define the inner product of two vectors, and the norm(length) of a vector which is derived from the inner product of the vector with itself. The vectors of length 1 are sometimes referred to as unit vectors. We will discuss complex unit vectors in 2-dimensional space and how they relate to qubits. 

This will lead to a discussion of the Bloch sphere which will be a useful way of understanding qubits and how quantum gates act on them.

Below we show how we can take inner product of two vector:

![Task 1 Snip 5](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%201/assets/Task%201%20Snip%205.png)

Pretty simple right?!

Matrices form the foundation for quantum gates, Matrices are also called operators in the context of quantum computing, we can define matrices using np.array or np.matrix:

![Task 1 Snip 6](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%201/assets/Task%201%20Snip%206.png)

Hermitian conjugates are given by taking the conjugate transpose of the matrix. This means we compute the complex conjugate of each entry, and then transpose the matrix. Generally, the Hermitian conjugate is denoted by M-dagger, let’s calculate it:

![Task 1 Snip 7](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/Task%201/assets/Task%201%20Snip%207.png)

In this section we will discuss how to take tensor products of matrices in order to later build quantum gates that operate on many qubits at once, Understanding the basics of tensor products of matrices is fundamental to understanding quantum logic gates and quantum circuits. you can see an example of how we can do tensor product of two matrices in general, we multiply each entity in the first matrix with other matrix and we get a matrix with larger dimension.
 
In the next task we will talk about Qubits and Qubit states.
 
 
Quiz Questions: 

**What is the real part and imaginary part of the numbers 12-3i, 28 in order?**

**12, 28**  *Answer*

 -3, 28

 12, 0
...
