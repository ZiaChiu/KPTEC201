# KPTEC201

#### Subject Name: Data Visualization in R

#### Lecture Notes and Assignment Examples

### Lecture Notes

-   Why R

-   IDE Install & Using Tutorial



# Lecture Notes

All notes are summarized according to the order of the original contents of the lecture.

## Introduction

#### What is and Why R?

R is designed for data analysis and statistical computing. Widely used for conducting statistics and specialized data analysis tasks.

Some classmates who have studied python and java will want to try to find the code logic corresponding to python or java in R's documentation. But when I tried to use R to deal with some accounting problems, I found that the programming process of R tended more to the process-oriented programming of C.

Once the logic of the code starts to become complex, you need to use concepts such as classes and functions similar to Python to achieve code reuse (that is, object-oriented programming). Most of the time, you don't need to use OOP. The purpose of the R language is to process data, not to develop a program that can be run.

## IDE Install & Using Tutorial

PS: I personally recommend Visual Studio and RStudio

### RStudio(R IDE)

-   For Windows

[R 4.4.1 for windows](https://cran.rstudio.com/bin/windows/base/R-4.4.1-win.exe)

[RStudio 4.2 for windows](https://download1.rstudio.org/electron/windows/RStudio-2024.04.2-764.exe)

[![How to Install R and RStudio on Windows 10/11 [ 2024 Update ] R Programming Tutorial –YT](https://img.youtube.com/vi/9SzKJH93t5o/maxresdefault.jpg){width="442"}](https://www.youtube.com/watch?v=9SzKJH93t5o)

-   For MacOS

[R 4.4.1 for MacOS Apple Chips](https://cran.rstudio.com/bin/macosx/big-sur-arm64/base/R-4.4.1-arm64.pkg)

[R 4.4.1 for MacOS Intel](https://cran.rstudio.com/bin/macosx/big-sur-x86_64/base/R-4.4.1-x86_64.pkg)

[![How to Install R and RStudio on Mac / MacOS (2024) – YT](https://img.youtube.com/vi/I5WIMX4LK8M/maxresdefault.jpg){width="442"}](https://www.youtube.com/watch?v=I5WIMX4LK8M)

-   For Ubuntu Desktop

[![How to install RStudio and R on Ubuntu – YT](https://img.youtube.com/vi/bn8NvoSyLDA/hqdefault.jpg)](https://www.youtube.com/watch?v=bn8NvoSyLDA)

##### R Tools for Visual Studio

-   For Windows

[![R Tools for Visual Studio Public Preview – YT](https://img.youtube.com/vi/KPS0ytrt9SA/maxresdefault.jpg)](https://www.youtube.com/watch?v=KPS0ytrt9SA)


##### Visual Studio Code


-   For Windows

[![How Install Visual Studio Code on Windows 11 (VS Code) (2024)](https://i3.ytimg.com/vi/cu_ykIfBprI/maxresdefault.jpg)](https://www.youtube.com/watch?v=cu_ykIfBprI)

-   For MacOS

[![How to Install Visual Studio Code on Mac | Install VSCode on macOS (2024)](https://i3.ytimg.com/vi/w0xBQHKjoGo/maxresdefault.jpg)](https://www.youtube.com/watch?v=w0xBQHKjoGo)


-   For Ubuntu Desktop

[![How to Install and Use Visual Studio Code on Ubuntu 22.04 LTS Linux (VS Code)](https://i3.ytimg.com/vi/ChwsFldra-o/maxresdefault.jpg)](https://www.youtube.com/watch?v=ChwsFldra-o)


[[R language setting from Micosoft]](https://code.visualstudio.com/docs/languages/r)




## Variable
- R logic: there is no any constant variable in R language.
### set a new var

- character(string)
## R logic: When writing code, always pay attention to whether there is """ at the end of the string. If not, all code after the string will become part of the string (regardless of whether you have a newline or not.
    name <- "Zia"
### method(print())
- R logic: Similar to python, R's print is only responsible for printing the code results in a single line.
    print(name)
    - Zia
### method(cat())
- R logic: R’s cat is responsible for printing code results in multiple lines.
    
        cat(”Hi,
            Welcome to the R code World.
        
            Regards,
            Zia”)
            - 
            Hi,
            Welcome to the R code World.
        
            Regards,
            Zia

- numberic
## Numeric includes all numbers, which can be integer(28), float(28.0), or double(28.00).
## R logic: R automatically converts between these two classes when needed for mathematical purposes.
---
    age <- 28.0
---
    age <- 28
---
    age <- 28.00

- integer 
## A variable that exists specifically to record integers
- R logic: there are completely different between the integer of numeric and the integer data type.
---

    ### time now
    second <- 15L
    minutes <- 18L
    hours <- 15L
- complex
## Only enabled when using imaginary numbers
---

    a <- i

- logical(Boolean)
## True or Fale
---

    graduated <- False 



### check data type 
    class()

## math

- R logic: you can just input the math on the R console 

### + \ -\ * \ /

- 1+2

- 2*2

- 2/2

- 2-2

- 2 %% 2

- 2 %/% 2

### method

-  maximum value 

        max(1,4,5,6,8)
        - 8
-  minimum value
    
        min(1,5,7,3,0)
        - 0

- square root
    
        sqrt(4)
        - 2

- absolute value

        abs(-4)
        - 4

#### Value trade-off

- ### Trade up
If there is a float or double value greater than 0, one is automatically added to the integer bit.
    
    ceiling(1.4)
    - 2

- ### Trade down
If there is a float or double value greater than 0, the decimal places are automatically omitted and the original integer digits are retained.
        
    floor(1.4)
    - 1

- ### < \ > \ == \ !=

- a < b
    
        1 < 2
        - True
        2 < 1
        - False

- a <= b

    1 <= 2
    # True
    2 <= 2
    # True
    3 <= 2
    # False


- a >= b

        3 >= 2
        # True
        2 >= 2
        # True
        1 >= 2
        # False


### a > b 
    3 > 2
    # True
    2 > 3
    # False


### a == b
    2 == 2
    # True
    1 == 2
    # False
    

### a != b

    1 != 2
    # True
    2 != 2
    # False

### logical symbols &\&&\|\||\!







## Basic package

### common petermeters

-   main: the main title of the chart
-   sub: the sub-title under the main title.
-   xlab: the title name of the horizontal axis
-   ylab: the title name of the vertical axis
-   asp: the range which the chart will display
    -   xlim: The range from the start to the end of the X-axis
    -   ylim: The range from the start to the end of the Y-axis
-   axes: whether to display the axis(default is TRUE)
-   col: points’ color

```{r col, echo=TRUE, message=TRUE, warning=TRUE}
## using the colors() function to check what colours in R exis
print(colors(distinct = TRUE)[1:25])
```

-   pch: points’ shape

![image](http://www.sthda.com/sthda/RDoc/figure/graphs/r-plot-pch-symbols-points-in-r.png)

-   border: Set border color for histograms and bar charts

-   

#### - plot(x,y,type,main,sub, xlab, ylab,asp)

plot can be used to draw line charts and scatter plots

-   x: The horizontal axis of the coordinates
-   y: vertical axis of coordinates
-   type: Chart type
    -   "p" for points,
    -   "l" for lines,
    -   "b" for both,
    -   "c" for the lines part alone of "b",
    -   "o" for both ‘overplotted’,
    -   "h" for ‘histogram’ like (or ‘high-density’) vertical lines,
    -   "s" for stair steps,
    -   "n" for no plotting.
-   Example(only points):

```{r message=TRUE, warning=TRUE, paged.print=FALSE}
    par(mar=c(3,3,3,3))

    # Create a vector of days of the week
    day <- factor(c("M", "T", "W", "Th", "F", "S", "Su"),levels = c("M", "T", "W", "Th", "F", "S", "Su"))

    sales_volume <- c(100,200,300,400,500,600,700)

    # Create a plot

    plot(day,sales_volume,main="Sales Volume by Day of the Week",xlab="Day of the Week",ylab="Sales Volume",col="blue",pch=19,xlim=c(1,7),ylim=c(0,800))
```

-   Example(points and lines)

```{r echo=TRUE, message=TRUE, warning=TRUE}
par(mar=c(3,3,3,3))
    # Create a vector of days of the week
    day1 <- factor(c("M", "T", "W", "Th", "F", "S", "Su"),levels = c("M", "T", "W", "Th", "F", "S", "Su"))

    sales_volume1 <- c(100,200,300,400,500,600,700)
    # use plot.default() to display the line or point in the plot
    plot.default(day1, sales_volume1, type="o", main="Sales Volume by Day of the Week",xlab="Day of the Week", ylab="Sales Volume", col="blue", pch=19, ylim=c(0, 800),axes = TRUE)

```

-   limitations:
    -   The plot function is limited to the basic visualization techniques. It is not suitable for complex data visualization.
    -   when you are using factor as your x-axis, you need to specify the levels of the factor. Otherwise, the plot will not display the x-axis labels correctly.
        -   when you are using the factor at plot(), you can not see the line or point in the plot. You need to use the plot.default() function to display the line or point in the plot.

### hist()

hist is used to draw histograms. A common use is the frequency of occurrence of real-world data.

-   x: The data you need to count can be c() or the column specified in data.frame
-   breaks: The number of intervals in the histogram.This determines how many bars you will draw within the specified range.
-   freq: Whether to display the frequency of the histogram. The default is TRUE. When it is false, the chart represents the weight of the data.
-   density: Decorative effect, the default is 0, every time the value is increased by one, the histogram will have an extra straight line as a watermark.
-   angle: The angle of the watermarkline, the default is 45 degrees.
-   labels: Whether to display data on top of the bar chart, the default is FALSE.
-   
-   Example(Frequency):

```{r echo=TRUE, message=TRUE, warning=TRUE, paged.print=TRUE}
# Create random sample data

data_points <- rpois(100, 10) 
# Set the value range of each histogram of the histogram, which indirectly determines the density of the histogram.
bks <- seq(0, 30, by =1)
# Generate histogram

hist(data_points, main = "Histogram of Data Points", xlab = "Data Points", ylab = "Frequency", breaks =bks , col = "lightblue", border = "black", xlim = c(0, 30), ylim = c(0, 30))
```

-   Example(Density):

```{r echo=TRUE, message=TRUE, warning=TRUE, paged.print=TRUE}
# Create random sample data
data_points <- rnorm(100, mean = 50, sd = 10)

# Histogram with densities/weight
hist(data_points,density=2, freq = FALSE, main = "Histogram (Densities)",xlab = "Data Points", ylab = "Density")
```

### barplot()

barplot is often used to display quantities and make comparisons. For example, compare the numerical sizes of A, B, C, and D, and compare the numerical sizes of vertical columns in a 4\*2 matrix.

-   x: The data you need to count can be c() or the column specified in data.frame

-   height: Define the maximum height of the chart

-   beside: Whether to group every two charts as one groups

-   names.arg: Name the horizontal axis coordinates

-   space: The distance between each group of charts.Usually the vector c(a,b) is used to control the spacing between the bars within each group, and b is responsible for the external spacing between each group.

-   density: Decorative effect, the default is 0, every time the value is increased by one, the histogram will have an extra straight line as a watermark.

    -   angle: The angle of the watermarkline, the default is 45 degrees.

-   horiz:Determines whether the charts are displayed vertically or horizontally. The default is false. If true, the entire chart will be rotated 90 degrees.

-   width: Control the thickness of the bar chart

-   offset:set the starting position of the histogram, usually used when drawing Gantt chart

-   Example(Gantt chart):

```{r echo=TRUE, message=TRUE, warning=TRUE, paged.print=TRUE}
# Gantt chart example using offset for task start times
task_duration <- c(3, 5, 2)
task_names <- c("Planning", "Designing", "Backlog")
start_time <- c(1, 4, 7)

barplot(task_duration, names.arg = task_names, offset = start_time, 
        horiz = TRUE, col = c("red","yellow","green"), main = "Gantt Chart Example for sprint of scrum", 
        xlab = "Duration", ylab = "Tasks")
```

-   Example(matrix):

```{r echo=TRUE, message=TRUE, warning=TRUE, paged.print=FALSE}
# Create random 4*2 matrix
data <- matrix(c(5, 10, 15, 20, 7, 14, 21, 28), nrow = 2)

# Create a barplot
barplot(data, beside = TRUE, space = c(0, 2), horiz = FALSE, col = c("blue", "red"), legend.text = TRUE, main = "Barplot of a Matrix")
```

-   Example(Basic)

```{r echo=TRUE, message=TRUE, warning=TRUE, paged.print=FALSE}
# Simple barplot with custom heights and labels
heights <- c(5, 9, 1, 11)
names <- c("A", "B", "C", "D")

barplot(heights, names.arg = names, col = "lightblue", 
        main = "Basic Bar Plot", xlab = "Categories", ylab = "Values")
```

### boxplot()

boxplot is used to display the includes the outliers, the median, the mode, and where the majority of the data points lie in the data box. It is often used to compare the distribution of data in different groups.

-   x(data source option): You can directly set the vector c() as data
-   data: You can set the data.frame as data. The method of use is to add (starting column name \~ ending column name, data=data.frame format variable name) before other parameters.
-   