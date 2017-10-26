

IF NOT EXISTS( SELECT *
  FROM [sys].[database_event_sessions] WHERE name = 'AzureMonitor-SimpleTrace' )
CREATE
    EVENT SESSION
        [AzureMonitor-SimpleTrace]
    ON DATABASE

	ADD EVENT sqlserver.rpc_starting
		( ACTION(package0.event_sequence,sqlserver.database_name,sqlserver.request_id,sqlserver.session_id,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.transaction_sequence)),
	ADD EVENT sqlserver.rpc_completed
		( ACTION(package0.event_sequence,sqlserver.database_name,sqlserver.request_id,sqlserver.session_id,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.transaction_sequence)),
	ADD EVENT sqlserver.sql_statement_starting
		( ACTION(package0.event_sequence,sqlserver.database_name,sqlserver.request_id,sqlserver.session_id,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.transaction_sequence)),
	ADD EVENT sqlserver.sql_statement_completed
		( ACTION(package0.event_sequence,sqlserver.database_name,sqlserver.request_id,sqlserver.session_id,sqlserver.sql_text,sqlserver.transaction_id,sqlserver.transaction_sequence))
    ADD TARGET
        package0.event_file
            (
            -- TODO: Assign AzureStorageAccount name, and the associated Container name.
            -- Also, tweak the .xel file name at end, if you like.
            SET filename =
                '$(credential_name)/trace-file.xel'
            )
    WITH
        (MAX_MEMORY = 10 MB,
        MAX_DISPATCH_LATENCY = 3 SECONDS)
    ;
GO