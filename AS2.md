# Introduction

The greatest need for large data sets is to reduce latency and improve response times. Battle and Scheidegger (2020) mention materialised views, approximate query processing, user modelling, and other techniques to ensure that data analysis remains fast, interactive, and accurate even in large and complex databases.


# Fundamentals of Data Visualisation: 

Data Visualization uses all possibilities to display the database and data held through visible human diagrams. For example, to show the progress of the project, we have a Gantt chart; to show the trend of the data, we have a line chart; to show the size of the data, we have a bar chart; and to show our ideas, we have a UML diagram.

We have been trying to use pictures to learn to speak since we were one year old and used animations to learn about life experiences as children. When we grow up, we use various diagrams through subjects to help people understand algorithms more quickly. Appropriate visualisation can enhance our efficiency in accepting data. Similarly, instead of discovering the pattern of a set of numbers from a bunch of numbers, it is better to depict all the data in a coordinate system through countless points to depict the typical characteristics of the data set.

# Visualisation Techniques in R: 

## Basic package
###  plot(x,y,type,main,sub, xlab, ylab,asp)

- - x: The horizontal axis of the coordinates
- - y: vertical axis of coordinates

- - type: Chart type

- - -	"p" for points,

- - -	"l" for lines,

- - -	"b" for both,

- - -	"c" for the lines part alone of "b",

- - -	"o" for both ‘overplotted’,

- - -	"h" for ‘histogram’ like (or ‘high-density’) vertical lines,

- - -	"s" for stair steps,

- - -   "S" for other steps, see ‘Details’ below,

- - -	"n" for no plotting.
- - main: the main title of the chart
- - sub: the sub-title under the main title.
- - xlab: the title name of the horizontal axis
- - ylab: the title  name of the vertical axis
- - asp: the range which the chart will display
- - - xlim: The range from the start to the end of the X-axis
- - - ylim: The range from the start to the end of the Y-axis
- - col: points’ colour
- - using the colors() function to check what colours in R exist

- - - colors()[1:25]
- - - [1] "white"          "aliceblue"      "antiquewhite"   "antiquewhite1"  "antiquewhite2" 
- - - [6] "antiquewhite3"  "antiquewhite4"  "aquamarine"     "aquamarine1" "aquamarine2"   
- - - [11] "aquamarine3"    "aquamarine4"    "azure"          "azure1"         "azure2"        
- - - [16] "azure3"         "azure4"         "beige"          "bisque"         "bisque1"       
- - - [21] "bisque2"        "bisque3"        "bisque4"        "black"          "blanchedalmond"

- - pch: points’ shape
 

- - Example:

        # Create a vector of days of the week
        day <-c(1,2,3,4,5,6,7)
        sales_volume <- c(100,200,300,400,500,600,700)

        # Create a plot

        plot(day,sales_volume,main="Sales Volume by Day of the Week",xlab="Day of the Week",ylab="Sales Volume",col="blue",pch=19,xlim=c(1,7),ylim=c(0,800))

### hist()












