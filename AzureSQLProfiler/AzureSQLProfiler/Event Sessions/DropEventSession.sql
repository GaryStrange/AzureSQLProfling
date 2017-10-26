IF EXISTS( SELECT *
  FROM [sys].[database_event_sessions] WHERE name = 'AzureMonitor-SimpleTrace' )
BEGIN
	ALTER EVENT SESSION  [AzureMonitor-SimpleTrace]
	ON DATABASE
	DROP TARGET package0.event_file;
 
	DROP EVENT SESSION [AzureMonitor-SimpleTrace]
	ON DATABASE;
END