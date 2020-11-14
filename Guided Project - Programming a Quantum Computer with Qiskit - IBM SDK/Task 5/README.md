## Task 5: Bernstein-Vazirani Algorithm

# Learning objective:

The Bernstein-Vazirani algorithm can be seen as an extension of the Deutsch-Josza algorithm we covered in the last section. 

It shows that there can be advantages in using a quantum computer as a computational tool for more complex problems, Quantum computing can go far beyond the possibilities of today’s classical high performance computing.
 
Suppose we have a black box, by it we mean we cannot get any information from it, there is a binary string in this box and we want to know the number.

With classical computer very time we can perform a single and operation on box and see the output result and finally get to know the number. But with a Quantum computer and by using Bernstein-Vazirani Algorithm we can know the number just with on operation.

In order to implement Bernstein-Vazirani Algorithm, we need to take few steps:

1. Initialise the inputs qubits to the |0> state, and output qubit to |->.

2. Apply Hadamard gates to the input register

3. Query the oracle

4. Apply Hadamard gates to the input register

5. Measure

Here we go through the example of two qubit calculation (in notebook), then we implement the algorithm for an arbitrary binary string number.
(After explaining two qubit calculations) Here write the code for the mentioned steps above:
 

![Task 5 Snip 1](Add Task 5 Snip 1 Link)

As we promised we examine the circuit and see the result so that we can see the outcome in a single shot:
 
![Task 5 Snip 1](Add Task 5 Snip 1 Link)

As we can see the result is our desired outcome.

** Quiz Questions: Is this sentence true: we only apply Hadamard gates on inputs qubits? **

It’s correct

** *It’s incorrect ** * Answer * 
