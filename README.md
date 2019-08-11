# InAccuWeatherApp

Swift Project Created by Allie Adams, Hitesh Moudgil and Bethany Belbin

The Design

2.	The Model. This question has 2 parts
a.	What properties and methods would the “InAccu Weather” model need to function as described in part 1. 
Properties:
var locationEntered: String = “”
let locationsList = []
let locationNames = [String :String]
let dataReceived =data
let API_BASE_URL
let jsonString =String

Methods :
func getCurrentWeather()
func getRandom()

b.	Show the implementation (on paper, in the space below) of each of those methods to clarify their purpose as well as the logic needed to perform the functions. 
i.	Show the methods and what goes in it?

The getCurrentWeather method takes the locationEntered property and passes it into into a property within the method. There is a nested method within the getCurrentWeather method, that generates a random number between 0-19 that represents the indices of an array of locations. Set a variable to the value of that index returned from the method. Check to see if locationEntered equals the value generated from get random index method. If yes, re run getRandom function, if they do not match return the new (random) location. Set variable for the api url from the openweathermap api with the random location. Then do the api call to receive data.

3.	The Controller. This question has 3 parts.
a.	What tasks would the view controller be performing?
From the first view the viewcontroller takes the user input and stores that value upon the user hitting the search button. It will then trigger a segue to the second view controller.
b.	Which IBOutlets and IBActions would it need?
IBOutlets:
SearchBar 
DateTime
Temperature
WeatherDescription
WeatherLocation

IBActions:
SearchButton


c.	Show the implementation (on paper, in the space below) of the main event listener that processes the touch events received when the user presses the search button. Describe the logic in plain English, pseudo-code, a flow-chart, or using Swift coding. If you use Swift, you will not lose marks for syntax errors or for getting any keywords / native function names wrong as long as the intention is made clear through words used. 
The main event listener waits for the user to hit the search button. The controller generates a random number that corresponds to the index of an array of locations. If the location is the same as the value of the as the value pulled from the array the random number generator is run again (keep in mind, we want the weather for an incorrect location). The incorrect location is used to create an api call and string. We use the api call and url to get the data. Convert the data into something human readable and store the values. Convert the temperature variable from kelvin to Celsius. Set text of various labels to the corresponding stored values. Change image icon to corresponding weather icon. 
4.	Describe how you can use auto-layout to have your game view adapt to different screen sizes by mentioning how you will group views and the constraints you will need. 

For the first view, we would add constraints to the title label, to the textfield and the search button. These constraints will be relative to each other as well as the outside parameters of the string.

For the second view we will first start by putting the imageview, the datatimelabel temperature label weatherdescription label into a stackview. Then we would add constraints to the stackview as relative to the width of the screen as well as constraints to the individual components relative to each other.

Finally, we would add a constraint to the footer to the full width of the screen and relative to the stackview. 

