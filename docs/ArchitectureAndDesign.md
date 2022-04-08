## Architecture and Design


### Logical architecture

- `Display`: Responsible for interaction Uni with user.
- `Model`: Models of each database.
- `API`: Connection between Uni and Sigarra. The main goal for this service is upload information about students.
- `Database`: Communication between Sigarra database and Uni, containing information about students and teachers.

![aa drawio](https://user-images.githubusercontent.com/72892065/162307299-8668a01f-3662-49d6-a930-b346f15dadfd.png)

### Physical architecture

In our app's physical architecture only 2 entities are featured: the server where the database with all the information required by the client; and the app itself, which the user interacts with.
Regarding technologies, we are going to use Flutter (with the Dart programming language) for the frontend and Firebase for the backend.

![Deployment View](../images/deployment_view.png)

### Vertical prototype

The following user stories were implemented:

- Screen with the app credits (name and authors).