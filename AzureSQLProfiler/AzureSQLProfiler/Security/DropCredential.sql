--Before creating a database scoped credential, the database must have a master key to protect the credential.
IF EXISTS( select * from sys.database_scoped_credentials where name = '$(credential_name)' )
DROP DATABASE SCOPED CREDENTIAL
		--must be a storage account SAS and not a blob account SAS. Plus the container
        [$(credential_name)]
