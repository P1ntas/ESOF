## Requirements

### Use case model 

![usecasemodel](images/use_case_model.png)

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
| *Normal flow* | 1. The student receives the notification.<br> 2. The notification redirects to the UC page.<br> 3. On the page presented, it will be shown the updated number of absences of the particular UC. |
| *Alternative flows and exceptions* | 1. [Justified absence] If notification has already been sent but absence has been justified, the notification will redirect to an error page telling the user the notification is no longer valid. |


|||
| --- | --- |
| *Name* | Cancel Absence |
| *Actor* |  Teacher | 
| *Description* |If the student is absent and has justification, he can justify and this absence will not be counted.. |
| *Preconditions* | The teacher needs to mark the student's absence from class and the student needs an justification for the absence. |
| *Postconditions* | The absence is not count . |
| *Normal flow* | 1.The teacher marks the absence.<br> 2.The student receives notification of the absence.<br> 3. The student shows willingness to justify the absence. And then, if he is accepted at the secretary's office, the teacher can go and remove the absence. |
| *Alternative flows and exceptions* | 1. [Justification not valid] If the justification is not valid then the fault will continue to be counted|

