IF EXISTS( SELECT *
  FROM [sys].[database_event_sessions] WHERE name = 'AzureMonitor-SimpleTrace' )
AND	
	EXISTS( select * from sys.dm_xe_database_sessions WHERE name = 'AzureMonitor-SimpleTrace' )
ALTER EVENT SESSION [AzureMonitor-SimpleTrace]
ON DATABASE
STATE = stop;