for month in {01..12}
do
  hive -e "
    CREATE EXTERNAL TABLE IF NOT EXISTS flight_2018_${month} (
      FlightDate DATE,
      CRSDepTime INT,
      CRSArrTime INT,
      DepTimeBlk STRING,
      ArrTimeBlk STRING,
      Cancelled INT,
      CancellationCode STRING,
      CarrierDelay DOUBLE,
      WeatherDelay DOUBLE,
      NASDelay DOUBLE,
      SecurityDelay DOUBLE,
      LateAircraftDelay DOUBLE,
      TotalAddGTime DOUBLE,
      LongestAddGTime DOUBLE,
      DepDelay INT,
      ArrDelay INT,
      DepDelayMinutes INT,
      ArrDelayMinutes INT,
      DepDel15 INT,
      ArrDel15 INT,
      DepartureDelayGroups INT,
      ArrivalDelayGroups INT,
      Marketing_Airline_Network STRING,
      Operating_Airline STRING,
      Origin STRING,
      Dest STRING,
      Distance DOUBLE,
      DistanceGroup INT,
      TaxiOut DOUBLE,
      TaxiIn DOUBLE,
      AirTime DOUBLE,
      DayOfWeek INT,
      Month INT,
      Quarter INT,
      Year INT
    )
    STORED AS PARQUET
    LOCATION 'hdfs:///user/talentum/flight_2018/Flights_2018_${month}/';
    
    INSERT OVERWRITE TABLE flight_2018_${month}
    SELECT * FROM parquet.'hdfs:///user/talentum/flight_2018/Flights_2018_${month}/';
  "
done

