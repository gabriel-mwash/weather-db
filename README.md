# **A WEATHER PROJECT MYWAY...... USING MYSQL**😃
<p align="center">
<img  src="https://github.com/gabriel-mwash/weather-db/assets/124787358/c5b91aab-ef08-40e8-8d40-3bbe947cba41">
</p>

## WE WILL COVER THE FOLLOWING:
1. Loading data locally using mysql
2. Scheduling scripts to run at a given time
3. writing scripts with bash
4. It's about MYSQL BTW.. DON'T FORGET

## ABOUT THE PROJECT
A simple weather database project. A certain truck company wants to keep track of weather conditions on major 
cities along its route. To obtain this data, the truck company receives the weather data from a certain weather
station, every 5 minutes as a .CSV file through a FTP. (though we won't set up an FTP protocal today, we'll just
add the .CSV file manually to our folder) <br>

This is where the magic happens. A script has to run every 5 minute to check wether a .CSV file has been recieved. 
If a new .CSV file is loaded through the FTP, the script automatically runs the SQL files that upload the data from 
the .CSV file into the database. Here is the DFD: <br>

<p align="center">
<img height="600rem" src="https://github.com/gabriel-mwash/weather-db/assets/124787358/42f94eab-86f1-4dbf-8351-64ba4f812104">
</p>

## WTF IS CRON..
Remember we have a script that runs every five minutes and checks weather we have a loaded .CSV file in our directory? 
This is done by the cron scheduler. The cron is a scheduler commonly used in unix/linux systems to schedule tasks at 
specific time.... For instance, our script isscheduled to run every five minutes. To create a  scheduler run the 
following: <br>
`$ crontab -e` <br>
The cron scheduler will open your default editor and inside the editor, type the following: <br>

` */5 * * * * ~/path-to-scheduler` <br>

The aestricks represent various time format.... (for instance, the first * represents seconds)
To learn more about cron scheduler [click here](https://crontab.guru/) <br>
(I don't wanna teach cron scheduler today 🙂 <br>

## The script (BASH guys are smiling now 😃 )
The script changes directory to the location of where the .CSV file is expected to be loaded by the FTP.
The script checks weather the .CSV file has been loaded... If loaded it establishes a connection with mysql server: <br>

`mysql --local_infile=1 -h 127.0.0.1 -D database_name -u username -pPassword -s` <br>

It then runs the load_weather.sql which loads the data into the **current_weather_load table**.... 
Incase of any problems encountered during the loading of data from the .CSV file into the table the errors are logged into a
file called **load_weather.log**. Here's the trick... The script goes further and checks wether the load_weather.log file is 
empty (0 bytes) ... If its empty, then there were no errors and data was loaded successfully... Therefore, establish a connection 
to the server and copy the data loaded into the **current_weather_load table** into the **current_weather table**

## A bit of info on the scripts(dont wanna leave you in the dark)
The current_weather_load sql script checks wether there are some errors or missing data in the file... Since the cities don't change 
the sql checks wether the data loaded in the current_weather_load is the same as the one in the loaded in the current_weather table. 
If there is a city missing, then the error is logged in the **load_weather.log** in the script.




