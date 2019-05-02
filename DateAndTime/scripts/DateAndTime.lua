--[[----------------------------------------------------------------------------

  Application Name:
  DateAndTime
                                                                                             
  Summary:
  Retrieving date and time in various option and switching time zones
  
  Description:
  In this sample various options of the DateTime CROWN are shown. To run, a device
  has to be used, which is supporting the used functions. This is for example valid
  for any SIM4000 device. For all available options the API reference of the device
  or the code completion with any connected device can be used.
  
  How to run:
  To show, the sample must be run on the device. The results are then printed
  to the console.
      
------------------------------------------------------------------------------]]
--Start of Function and Event Scope---------------------------------------------

--Declaration of the 'main' function as an entry point for the event loop
--@main()
local function main()
  --Retrieving timestamp at the beginning
  local startTime = DateTime.getTimestamp()
  -- Retrieving current date and time as string
  local dateTimeString = DateTime.getDateTime()
  print('Date and Time: ' .. dateTimeString)
  --Retrieving current date and local time as integers
  local d, mo, y, h, m, s, ms = DateTime.getDateTimeValuesLocal()
  print(string.format('Day: %d, Month: %d, Year: %d', d, mo, y))
  print(string.format('Hour: %d, Minute: %d, Second: %d, Millisecond: %d,', h, m, s, ms))

  --Retrieving current set time zone
  local tz = DateTime.getTimeZone()
  print('Current Timezone: ' .. tz)

  -- Setting time zone to GMT, zone can be edited in IANA tz database format
  -- Due to a different behavior on windows machines the timezone is only
  -- changed when connected to a real device. See function description for more details.
  if Engine.isEmulator() == false then
    DateTime.setTimeZone('GMT')
    print('Time zone switched to ' .. DateTime.getTimeZone())
    print('Date and time new time zone: ' .. DateTime.getDateTime())

    --Reseting to previous time zone
    --DateTime.setTimeZone(tz)
    print('Time zone switched back to ' .. DateTime.getTimeZone())
    print('Date and Time: ' .. DateTime.getDateTime())
  end

  --Retrieving Timestamp at the end and calculate duration
  local endTime = DateTime.getTimestamp()
  print('Duration of this script: ' .. (endTime - startTime) .. 'ms \n')
  print('App finished.')
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register('Engine.OnStarted', main)

--End of Function and Event Scope-----------------------------------------------
