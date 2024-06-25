/*
CREATE TABLE current_weather_load 
(
   station_id     INT            PRIMARY KEY, 
   station_city   VARCHAR(100),
   station_state  CHAR(2),
   station_lat    DECIMAL(6, 4)  NOT NULL,      -- location latitude
   station_lon    DECIMAL(7, 4)  NOT NULL,      -- location longitude
   as_of_dt       DATETIME,                     -- date & time data gathered
   temp           INT            NOT NULL,
   feels_like     INT,                          -- the temp that it currently feels like
   wind           INT,                          -- wind velocity km/hr
   wind_direction VARCHAR(3),
   precipitation  DECIMAL(3, 1),                -- precipitation in last hour
   pressure       DECIMAL(6, 2),
   visibility     DECIMAL(3, 1)  NOT NULL,      -- distance can be seen clearly(miles)
   humidity       INT,                          -- % or rel humidity in air
   weather_desc   VARCHAR(100)   NOT NULL,      -- descripton of current weather
   sunrise        TIME,                         -- time sun rises in location today
   sunset         TIME,                         -- time sun sets in location today

   CONSTRAINT CHECK(station_lat BETWEEN -90 AND 90),
   CONSTRAINT CHECK(station_lon BETWEEN -180 AND 180),
   -- CONSTRAINT CHECK(as_of_dt BETWEEN (now() - INTERVAL 1 DAY) AND now()),
   CONSTRAINT CHECK(temp BETWEEN -50 AND 150),
   CONSTRAINT CHECK(feels_like BETWEEN -50 AND 150),
   CONSTRAINT CHECK(wind BETWEEN 0 AND 300),
   CONSTRAINT CHECK(precipitation BETWEEN 0 AND 400),
   CONSTRAINT CHECK(pressure BETWEEN 0 AND 1100),
   CONSTRAINT CHECK(visibility BETWEEN 0 AND 20),
   CONSTRAINT CHECK(humidity BETWEEN 0 AND 100),
   CONSTRAINT CHECK(wind_direction IN 
      (
         "N", "S", "E", "W", "NE", "NW", "SE", "SW",
         "NNE", "ENE", "ESE", "SSE", "SSW", "WSW", "WNW", "NNW"
      )
   )
);

CREATE TABLE current_weather LIKE current_weather_load;
*/
