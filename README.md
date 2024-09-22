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

- ### <\>\==\!=

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
    ```

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





