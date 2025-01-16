# Employees http get request

## Description
This is a Simple flutter app which fetches employees data from an api using dio get method then caches data to local storage,
therefore employees can be retrieved even after restarting the app, it displays list of employees data along with a detailed info about the employees in a seperated page which you can navigate when clicking on the tile of the selected employee.

## Features

- Displays a list of employees with their Info.
- Seperate page for for detailed per employee tile
- a button for caching the the data received from the api
- Circular loading indicator while running the fetch process or pending for the data to be cached 

## code explanation
 the code flow is done as the following:-  
  1- once the app starts it checks if there's an existing cached Employees data, initially there's no data so no employees details will be displayed  
  2- on cacheButton pressed data is fetched from the api using dio get request  
  3- converting dio response back to string (since it already receives and converts the string to json map)    
  4- caching the response string to local storage  
  5- then the function in step 1 is triggered, it retrieves the data from the cached local storage  
  6- converts it to json map then to our employee class model  
  5- stores each class model after creating its instance in employees list then returning that list  
  7- data is now ready for displaying in listView builder of ListTile per Employee.  


## Application Screenshots: 
|![swappy-20250116-080454](https://github.com/user-attachments/assets/1032e6a3-aef1-4dd4-8c43-072d6157c2c2)|![swappy-20250116-111234](https://github.com/user-attachments/assets/659dddc1-401f-4601-bb62-553a7e961458)|![swappy-20250116-111315](https://github.com/user-attachments/assets/613af31f-073d-4cb1-a2a4-3c618c3c0a3f)|
|-|-|-|
