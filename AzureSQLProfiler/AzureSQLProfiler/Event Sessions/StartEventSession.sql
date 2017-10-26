IF EXISTS( SELECT *
  FROM [sys].[database_event_sessions] WHERE name = 'AzureMonitor-SimpleTrace' )
ALTER EVENT SESSION [AzureMonitor-SimpleTrace]
ON DATABASE
STATE = start;