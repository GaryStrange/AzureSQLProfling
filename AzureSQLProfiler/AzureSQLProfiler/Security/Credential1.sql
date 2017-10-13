CREATE
    DATABASE SCOPED
    CREDENTIAL
		--must be a storage account SAS and not a blob account SAS.
        [https://pricingpoclogs.blob.core.windows.net/xevents]
    WITH
        IDENTITY = 'SHARED ACCESS SIGNATURE',  -- "SAS" token.
        -- TODO: Paste in the long SasToken string here for Secret, but exclude any leading '?'.
        SECRET = '';
		--SECRET = N'sv=2017-04-17&ss=b&srt=sco&sp=rwdlac&se=2018-10-14T00:34:10Z&st=2017-10-12T16:34:10Z&spr=https&sig=2bGGt%2FHUXWtFljhKh0rOUM%2BHiiwIPEPRkfnCqIEzzDI%3D'