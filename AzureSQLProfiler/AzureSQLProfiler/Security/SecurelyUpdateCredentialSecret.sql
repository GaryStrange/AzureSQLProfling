-- not in build
-- SQLCMD variables can only be accessed in pre or post scripts.
-- this script is called by the postdeployment header script in the root.

ALTER
    DATABASE SCOPED
    CREDENTIAL
        [https://pricingpoclogs.blob.core.windows.net/xevents]
    WITH
        IDENTITY = 'SHARED ACCESS SIGNATURE',  -- "SAS" token.
        -- TODO: Paste in the long SasToken string here for Secret, but exclude any leading '?'.
        SECRET = '$(SECRET)'