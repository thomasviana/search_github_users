# search_github_users

This is a simple application to search Github users and display the user, avatar image and the number of repositories they have in a list. 
Debounce search is implemented so that the app doesn't hit the server on any new letter typed. 
I handle diferent states: Initial, loading, loaded, empty, error.

| Initial state           | Loading state           | Loaded state            | 
| :---------------------- | :---------------------- | :---------------------- | 
| <img src="https://user-images.githubusercontent.com/85323846/184419750-a1c410f0-f0c9-4753-a41d-dc0cae9fe018.png" width="225"/> | <img src="https://user-images.githubusercontent.com/85323846/184419748-ba8fbc63-c38e-4d2f-815d-037b89f90185.png" width="225"/> | <img src="https://user-images.githubusercontent.com/85323846/184419746-886ca972-bccc-4c8b-8a09-72e355efe25c.png" width="225"/> | 

| Empty state             | Error state             | Loaded state            |
| :---------------------- | :---------------------- | :---------------------- |
| <img src="https://user-images.githubusercontent.com/85323846/184419745-164e8169-dba5-4bbe-823c-6ee54f4f010a.png" width="225"/> | <img src="https://user-images.githubusercontent.com/85323846/184419719-d3fe7f5c-aa52-4c70-b189-3a6e7c65ad81.png" width="225"/> | <img src="https://user-images.githubusercontent.com/85323846/184420253-cb76b58c-5797-4b01-a750-255a58c13aea.png" width="225"/> | 
