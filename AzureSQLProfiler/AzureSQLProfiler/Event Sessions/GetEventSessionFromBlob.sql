CREATE VIEW dbo.vXE
AS
SELECT 
	 [SessionId]	= events.value('(action[@name="session_id"]/value)[1]', 'smallint')
	,[Statement]	= events.value('(data[@name="statement"]/value)[1]', 'varchar(max)')
	,[SqlText]		= events.value('(action[@name="sql_text"]/value)[1]', 'varchar(max)')
	,[Event]		= events.value('@name', 'varchar(max)')
	,[Database]		= events.value('(action[@name="database_name"]/value)[1]', 'varchar(max)')
	,[Duration_ms]	= events.value('(data[@name="duration"]/value)[1]','bigint') / 1000 --from microseconds to milliseconds
	,[timestamp]	= events.value('(@timestamp)[1]', 'datetime2')
	,[WaitType]		= events.value('(data[@name="wait_type"]/text)[1]','varchar(max)')

	,f.*

 FROM (
SELECT
		f.object_name
		,f.file_name
		,f.timestamp_utc
        ,CAST(event_data AS XML) AS [event_data_XML]
		
    FROM
        sys.fn_xe_file_target_read_file
            (
                -- TODO: Fill in Storage Account name, and the associated Container name.
                'https://asos02pteuwcmcdg01.blob.core.windows.net/xevents/trace-file',
                null, null, null
            ) f
	) f
	CROSS APPLY
		event_data_XML.nodes('/event') AS n(events)