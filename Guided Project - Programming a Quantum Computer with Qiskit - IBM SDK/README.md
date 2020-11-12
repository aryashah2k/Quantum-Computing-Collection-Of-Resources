## Running Codes On IBM Quantum Devices

**Step 1:**
Go to https://quantum-computing.ibm.com/
Create an account for accessing IBM Quantum Computers.

**Step 2:**
Log in into your account and you can see preview of your workspace and IBM Quantum devices in the right side of screen (their status, number of jobs waiting for execution ....):

![Step 2](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/assets/Step%202.png)

**Step 3:**
Go to your profile (My Account)
Copy the token for accessing quantum computers in qiskit:

![Step 3](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/assets/Step%203.png)

**Step 4:**
Execute your Code/Programs!

## Example : 
Let's create a quantum circuit and run it on IBM Quantum Computers, Here we create circuit for generating Entanglement:

import qiskit
from qiskit import *
qc = QuantumCircuit(2,2) #circuit with two qubit and two classical register
qc.h(0)
qc.cx(0,1)
qc.measure([0,1],[0,1])
qc.draw('mpl')

![Step 4](https://github.com/aryashah2k/Quantum-Computing-Collection-Of-Resources/blob/main/Guided%20Project%20-%20Programming%20a%20Quantum%20Computer%20with%20Qiskit%20-%20IBM%20SDK/assets/Step%204.png)

We import Our Token and execute the code on device :

token = 'Your token'
IBMQ.save_account(token)
provider = IBMQ.load_account()
device = provider.get_backend('ibmq_16_melbourne') #we use ibmq_16_melbourne quantum device
job = execute(qc, backend = device) #we pass our circuit and backend as usual
from qiskit.tools.monitor import job_monitor
job_monitor() #to see our status in queue
result = job_result()
counts= result.get_counts(qc)
print (counts)

**And you can see your result from running the code on an actual quantum device!**

