## Requirements

### Use case model 

|||
| --- | --- |
| *Name* | Register Attendance |
| *Actor* |  Teacher | 
| *Description* | The teacher registers the attendance of each student. |
| *Preconditions* | - The class needs to be happening at the moment of registration. <br> - If the class hasn't started yet or if the class has already ended the teacher cannot register the attendance. |
| *Postconditions* | - The attendance is registered and the students missing are notified |
| *Normal flow* | 1. The teacher accesses the app main page of the register system. <br> 2. The teacher selects the class that he wants to register <br> 3. The system shows the list of students in the current class.<br> 4. The teacher selects the students that are missing. <br> 5. The system asks for confirmation. |
| *Alternative flows and exceptions* | 1. [Register failure] If, in step 5 of the normal flow the registration fails, the system gives the teacher the possibility to cancel or retry. |


|||
| --- | --- |
| *Name* | Absence Warning |
| *Actor* |  Teacher | 
| *Description* | If students are close to reaching the maximum number of absences allowed, they receive a notification. |
| *Preconditions* | Student is close to failing class because of absences. |
| *Postconditions* | The student receives the notification. |
| *Normal flow* | 1. The customer accesses the web page of the ticketing system.<br> 2. The system shows the list of events with tickets on-sale.<br> 3. The customer selects the event and the number of tickets.<br> 4. If wanted, the costumer may Choose Places.<br> 5. The system shows the total price to pay.<br> 6. The system redirects the customer to Electronic Payment.<br> 7. The system delivers the electronic tickets to the customer with a unique identifier and QR code. |
| *Alternative flows and exceptions* | 1. [Justified absence] If student justifies his/her absence, the academic services will be able to remove it. |
