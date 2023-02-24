USE [QTC-Dashboard]

/*
DROP PROCEDURE [EFM].[GetOrganizationsByLob]
DROP PROCEDURE [EFM].[GetOrganizationDocumentsByOrganizationId]
DROP PROCEDURE [EFM].[GetComponentsByOrganizationId]
DROP PROCEDURE [EFM].[GetOrganizationRoles]
*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [EFM].[GetOrganizationsByLOB]
@Lob nvarchar(50)
AS

	BEGIN

		--SET NOCOUNT OFF;
		SELECT [LOBId]
              ,[ApplicationId]
              ,[IntegrationPoint]
			  ,[Name]
              ,[Active]
			  ,[Description]
			  ,[Address1]
			  ,[Address2]
			  ,[City]
			  ,[State]
			  ,[Country]
			  ,[CreatedDate]
			  ,[CreatedBy]
			  ,[UpdatedDate]
			  ,[UpdatedBy]
		  FROM [Dashboard].[Organization] where [LOBId] = @Lob

END

/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [EFM].[GetOrganizationDocumentsByOrganizationId]
@OrganizationId int = NULL
AS
	BEGIN
		  SET NOCOUNT OFF;
		  SELECT [OrganizationDocumentId]
				  ,[OrganizationId]
				  ,[Name]
				  ,[Description]
				  ,[Alias]
				  ,[CreatedDate]
				  ,[CreatedBy]
				  ,[UpdatedDate]
				  ,[UpdatedBy]
			  FROM [EFM].[OrganizationDocuments]  where [OrganizationId] = @OrganizationId

END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
*/

/*
CREATE PROCEDURE [EFM].[GetComponentsByOrganizationId]
@OrganizationId int = NULL
AS
	BEGIN
		
		  SELECT C.[ComponentId]
				  ,C.[ComponentType]
				  ,C.[OrganizationDocumentId]
				  ,C.[Name]
				  ,C.[Description]
				  ,C.[Alias]
				  ,C.[CreatedDate]
				  ,C.[CreatedBy]
				  ,C.[UpdatedDate]
				  ,C.[UpdatedBy]
				  ,O.[OrganizationId]
				  ,O.Alias as OrganizationDocumentAlias
			  FROM [EFM].[Components] C
			  INNER JOIN [EFM].[OrganizationDocuments] O ON (O.OrganizationDocumentId = C.OrganizationDocumentId)
			  where O.[OrganizationId] = (SELECT [OrganizationId] FROM [EFM].[Organizations] where [OrganizationId] = @OrganizationId)

END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
*/

/*
CREATE PROCEDURE [EFM].[GetOrganizationRoles]
AS

	BEGIN
		
		--SET NOCOUNT OFF;

		SELECT	 [AuthRoleMappingId]
				,[OrganizationId]
				,[OrganizationDocumentType]
				,[AuthRole]
				,[CreatedDate]
				,[CreatedUser]
				,[UpdatedDate]
				,[UpdatedUser]
			FROM [EFM].[AuthRoleMapping]
END

GO
*/