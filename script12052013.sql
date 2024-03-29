USE [pos]
GO
/****** Object:  Table [dbo].[test]    Script Date: 05/13/2013 08:59:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[test](
	[deptID] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NULL,
	[bgColor] [nvarchar](20) NULL,
	[textColor] [nvarchar](20) NULL,
	[costCenter] [nvarchar](10) NULL,
	[saleAcct] [nvarchar](20) NULL,
	[purchaseAcct] [nvarchar](20) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
	[image] [varchar](100) NULL,
	[deptName] [varchar](100) NULL,
 CONSTRAINT [PK_test] PRIMARY KEY CLUSTERED 
(
	[deptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[modifier_header]    Script Date: 05/13/2013 08:59:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modifier_header](
	[modifierID] [int] NOT NULL,
	[reference] [nvarchar](25) NULL,
	[description] [nvarchar](50) NULL,
	[divisible] [nchar](1) NULL,
	[comment] [nvarchar](200) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_modifier_header] PRIMARY KEY CLUSTERED 
(
	[modifierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modifier_detail]    Script Date: 05/13/2013 08:59:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modifier_detail](
	[modifierID] [int] NOT NULL,
	[itemID] [int] NULL,
	[isItem] [nchar](1) NULL,
	[portion] [float] NULL,
	[priceChange] [float] NULL,
	[position] [int] NULL,
	[formatID] [int] NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_modifier_detail] PRIMARY KEY CLUSTERED 
(
	[modifierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[family]    Script Date: 05/13/2013 08:59:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[family](
	[deptID] [int] NOT NULL,
	[sectionID] [int] NOT NULL,
	[familyID] [int] IDENTITY(1,1) NOT NULL,
	[familyName] [varchar](100) NULL,
	[reference] [nvarchar](25) NULL,
	[description] [nvarchar](50) NULL,
	[image] [varchar](100) NULL,
	[bgColor] [nvarchar](20) NULL,
	[textColor] [nvarchar](20) NULL,
	[costCenter] [nvarchar](10) NULL,
	[saleAcct] [nvarchar](20) NULL,
	[purchaseAcct] [nvarchar](20) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_family] PRIMARY KEY CLUSTERED 
(
	[deptID] ASC,
	[sectionID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[format]    Script Date: 05/13/2013 08:59:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[format](
	[formatID] [int] IDENTITY(1,1) NOT NULL,
	[reference] [nvarchar](25) NULL,
	[description] [nvarchar](50) NULL,
	[image] [varchar](100) NULL,
	[bgColor] [nvarchar](20) NULL,
	[textColor] [nvarchar](20) NULL,
	[combination] [nchar](1) NULL,
	[portion1] [float] NULL,
	[portion2] [float] NULL,
	[costSecond] [float] NULL,
	[favoriteCode] [int] NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_format] PRIMARY KEY CLUSTERED 
(
	[formatID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[brand]    Script Date: 05/13/2013 08:59:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[brandID] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [nvarchar](100) NULL,
	[description] [nvarchar](50) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_brand] PRIMARY KEY CLUSTERED 
(
	[brandID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 05/13/2013 08:59:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comment](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[reference] [nvarchar](25) NULL,
	[description] [nvarchar](50) NULL,
	[image] [varchar](100) NULL,
	[bgColor] [nvarchar](20) NULL,
	[textColor] [nvarchar](20) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[department]    Script Date: 05/13/2013 08:59:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[department](
	[deptID] [int] IDENTITY(1,1) NOT NULL,
	[deptName] [varchar](100) NULL,
	[description] [nvarchar](50) NULL,
	[image] [varchar](100) NULL,
	[bgColor] [nvarchar](20) NULL,
	[textColor] [nvarchar](20) NULL,
	[costCenter] [nvarchar](10) NULL,
	[saleAcct] [nvarchar](20) NULL,
	[purchaseAcct] [nvarchar](20) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[deptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[commentSelectInsertUpdateDelete]    Script Date: 05/13/2013 08:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[commentSelectInsertUpdateDelete] 
	-- Add the parameters for the stored procedure here
	@commentID INTEGER = -1,
	@reference varchar(25) = '',
    @description nvarchar(50) = '',
    @image varchar(100) = '',
    @bgColor nvarchar(20) = '',
    @textColor nvarchar(20) = '',
    -- @version timestamp,
    -- @createDate nvarchar(100) = '',
    @createUser int = -1,
    -- @lastModified timestamp,
    @modifyUser int = -1,
    @StatementType nvarchar(20) = '',
    
    @newID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- convert datetime from string
	-- SET @createDate = CONVERT(datetime, @createDate);

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'
	BEGIN
	insert into comment( reference, description, image, bgColor, textColor, createDate, lastModified, createUser, modifyUser) values
	( @reference, @description, @image, @bgColor, @textColor, GETDATE(), GETDATE(), @createUser, @modifyUser);
	
	SELECT @newID = SCOPE_IDENTITY();
	END
	
	IF (@StatementType = 'Select' AND @commentID = -1)
	BEGIN
	select * from comment
	END
	
	IF (@StatementType = 'Select' AND @commentID != -1)
	BEGIN
	select * from comment where commentID=@commentID 
	END
	
	IF @StatementType = 'Update'
	BEGIN
	UPDATE comment SET
		reference = @reference,
		description = @description, 
		image = @image, 
		bgColor = @bgColor, 
		textColor = @textColor, 
		lastModified = GETDATE(),
		modifyUser = @modifyUser
	WHERE commentID = @commentID
	END
	
	IF @StatementType = 'Delete'
	BEGIN
	DELETE FROM comment WHERE commentID=@commentID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[brandSelectInsertUpdateDelete]    Script Date: 05/13/2013 08:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[brandSelectInsertUpdateDelete] 
	-- Add the parameters for the stored procedure here
	@brandID INTEGER = -1,
	@brandName varchar(100) = '',
    @description nvarchar(50) = '',
    -- @image varchar(100) = '',
    -- @bgColor nvarchar(20) = '',
    -- @textColor nvarchar(20) = '',
    -- @costCenter nvarchar(10) = '',
    -- @saleAcct nvarchar(20) = '',
    -- @purchaseAcct nvarchar(20) = '',
    -- @version timestamp,
    -- @createDate nvarchar(100) = '',
    @createUser int = -1,
    -- @lastModified timestamp,
    @modifyUser int = -1,
    @StatementType nvarchar(20) = '',
    
    @newID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- convert datetime from string
	-- SET @createDate = CONVERT(datetime, @createDate);

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'
	BEGIN
	insert into brand ( brandName, description, createDate, lastModified, createUser, modifyUser) values
	(  @brandName, @description, GETDATE(), GETDATE(), @createUser, @modifyUser);
	
	SELECT @newID = SCOPE_IDENTITY();
	END
	
	IF (@StatementType = 'Select' AND @brandID = -1)
	BEGIN
	select * from brand
	END
	
	IF (@StatementType = 'Select' AND @brandID != -1)
	BEGIN
	select * from brand where brandID=@brandID
	END
	
	IF @StatementType = 'Update'
	BEGIN
	UPDATE brand SET
		brandName = @brandName,
		description = @description, 
		-- image = @image, 
		-- bgColor = @bgColor, 
		-- textColor = @textColor, 
		-- costCenter = @costCenter, 
		-- saleAcct = @saleAcct, 
		-- purchaseAcct = @purchaseAcct,
		lastModified = GETDATE(),
		modifyUser = @modifyUser
	WHERE brandId = @brandId
	END
	
	IF @StatementType = 'Delete'
	BEGIN
	DELETE FROM brand WHERE brandId = @brandId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[familySelectInsertUpdateDelete]    Script Date: 05/13/2013 08:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[familySelectInsertUpdateDelete] 
	-- Add the parameters for the stored procedure here
	@deptID INTEGER = -1,
	@sectionID INTEGER = -1,
	@familyID INTEGER = -1,
	@familyName varchar(100) = '',
	@reference varchar(25) = '',
    @description nvarchar(50) = '',
    @image varchar(100) = '',
    @bgColor nvarchar(20) = '',
    @textColor nvarchar(20) = '',
    @costCenter nvarchar(10) = '',
    @saleAcct nvarchar(20) = '',
    @purchaseAcct nvarchar(20) = '',
    -- @version timestamp,
    -- @createDate nvarchar(100) = '',
    @createUser int = -1,
    -- @lastModified timestamp,
    @modifyUser int = -1,
    @StatementType nvarchar(20) = '',
    
    @newID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- convert datetime from string
	-- SET @createDate = CONVERT(datetime, @createDate);

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'
	BEGIN
	insert into family ( deptID, sectionID, familyName, reference, description, image, bgColor, textColor, costCenter, saleAcct, purchaseAcct, createDate, lastModified, createUser, modifyUser) values
	( @deptID, @sectionID, @familyName, @reference, @description, @image, @bgColor, @textColor, @costCenter, @saleAcct, @purchaseAcct, GETDATE(), GETDATE(), @createUser, @modifyUser);
	
	SELECT @newID = SCOPE_IDENTITY();
	END
	
	IF (@StatementType = 'Select' AND @deptID = -1)
	BEGIN
	select * from family
	END
	
	IF (@StatementType = 'Select' AND @deptID != -1 AND @sectionID != -1)
	BEGIN
	select * from family where deptID=@deptID and sectionID=@sectionID
	END
	
	IF (@StatementType = 'Select' AND @deptID != -1 AND @sectionID != -1 AND @familyID != -1)
	BEGIN
	select * from family where deptID=@deptID and sectionID=@sectionID and familyID=@familyID
	END
	
	IF @StatementType = 'Update'
	BEGIN
	UPDATE family SET
		deptId = @deptId,
		sectionID=@sectionID,
		familyName = @familyName,
		reference = @reference,
		description = @description, 
		image = @image, 
		bgColor = @bgColor, 
		textColor = @textColor, 
		costCenter = @costCenter, 
		saleAcct = @saleAcct, 
		purchaseAcct = @purchaseAcct,
		lastModified = GETDATE(),
		modifyUser = @modifyUser
	WHERE deptId = @deptId and sectionID=@sectionID and familyID=@familyID
	END
	
	IF @StatementType = 'Delete'
	BEGIN
	DELETE FROM family WHERE deptId = @deptId and sectionID=@sectionID and familyID=@familyID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[departmentSelectInsertUpdateDelete]    Script Date: 05/13/2013 08:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[departmentSelectInsertUpdateDelete] 
	-- Add the parameters for the stored procedure here
	@deptID INTEGER = -1,
	@deptName varchar(100) = '',
    @description nvarchar(50) = '',
    @image varchar(100) = '',
    @bgColor nvarchar(20) = '',
    @textColor nvarchar(20) = '',
    @costCenter nvarchar(10) = '',
    @saleAcct nvarchar(20) = '',
    @purchaseAcct nvarchar(20) = '',
    -- @version timestamp,
    -- @createDate nvarchar(100) = '',
    @createUser int = -1,
    -- @lastModified timestamp,
    @modifyUser int = -1,
    @StatementType nvarchar(20) = '',
    
    @newID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- convert datetime from string
	-- SET @createDate = CONVERT(datetime, @createDate);

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'
	BEGIN
	insert into department ( deptName, description, image, bgColor, textColor, costCenter, saleAcct, purchaseAcct, createDate, lastModified, createUser, modifyUser) values
	(  @deptName, @description, @image, @bgColor, @textColor, @costCenter, @saleAcct, @purchaseAcct, GETDATE(), GETDATE(), @createUser, @modifyUser);
	
	SELECT @newID = SCOPE_IDENTITY();
	END
	
	IF (@StatementType = 'Select' AND @deptID = -1)
	BEGIN
	select * from department
	END
	
	IF (@StatementType = 'Select' AND @deptID != -1)
	BEGIN
	select * from department where deptID=@deptID
	END
	
	IF @StatementType = 'Update'
	BEGIN
	UPDATE department SET
		deptName = @deptName,
		description = @description, 
		image = @image, 
		bgColor = @bgColor, 
		textColor = @textColor, 
		costCenter = @costCenter, 
		saleAcct = @saleAcct, 
		purchaseAcct = @purchaseAcct,
		lastModified = GETDATE(),
		modifyUser = @modifyUser
	WHERE deptId = @deptId
	END
	
	IF @StatementType = 'Delete'
	BEGIN
	DELETE FROM department WHERE deptId = @deptId
	END
END
GO
/****** Object:  Table [dbo].[line]    Script Date: 05/13/2013 08:59:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[line](
	[brandID] [int] NOT NULL,
	[lineID] [int] IDENTITY(1,1) NOT NULL,
	[lineName] [nvarchar](100) NULL,
	[description] [nvarchar](50) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_line] PRIMARY KEY CLUSTERED 
(
	[lineID] ASC,
	[brandID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[formatSelectInsertUpdateDelete]    Script Date: 05/13/2013 08:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[formatSelectInsertUpdateDelete] 
	-- Add the parameters for the stored procedure here
	@formatID INTEGER = -1,
	@reference varchar(25) = '',
    @description nvarchar(50) = '',
    @image varchar(100) = '',
    @bgColor nvarchar(20) = '',
    @textColor nvarchar(20) = '',
    @combination nchar(1) = '',
    @portion1 float = -1,
    @portion2 float = -1,
    @costSecond float = -1,
    @favoriteCode int = -1,
    -- @version timestamp,
    -- @createDate nvarchar(100) = '',
    @createUser int = -1,
    -- @lastModified timestamp,
    @modifyUser int = -1,
    @StatementType nvarchar(20) = '',
    
    @newID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- convert datetime from string
	-- SET @createDate = CONVERT(datetime, @createDate);

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'
	BEGIN
	insert into format( reference, description, image, bgColor, textColor, combination, portion1, portion2, costSecond, favoriteCode, createDate, lastModified, createUser, modifyUser) values
	( @reference, @description, @image, @bgColor, @textColor, @combination, @portion1, @portion2, @costSecond, @favoriteCode, GETDATE(), GETDATE(), @createUser, @modifyUser);
	
	SELECT @newID = SCOPE_IDENTITY();
	END
	
	IF (@StatementType = 'Select' AND @formatID = -1)
	BEGIN
	select * from format
	END
	
	IF (@StatementType = 'Select' AND @formatID != -1)
	BEGIN
	select * from format where formatID=@formatID 
	END
	
	IF @StatementType = 'Update'
	BEGIN
	UPDATE format SET
		reference = @reference,
		description = @description, 
		image = @image, 
		bgColor = @bgColor, 
		textColor = @textColor, 
		combination = @combination,
		portion1 = @portion1,
		portion2 = @portion2,
		costSecond = @costSecond,
		favoriteCode = @favoriteCode,
		lastModified = GETDATE(),
		modifyUser = @modifyUser
	WHERE formatID = @formatID
	END
	
	IF @StatementType = 'Delete'
	BEGIN
	DELETE FROM format WHERE formatID=@formatID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[TestSelectInsertUpdateDelete]    Script Date: 05/13/2013 08:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TestSelectInsertUpdateDelete] 
	-- Add the parameters for the stored procedure here
	@deptID INTEGER = -1,
	@deptName varchar(100) = '',
    @description nvarchar(50) = '',
    @image varchar(100) = '',
    @bgColor nvarchar(20) = '',
    @textColor nvarchar(20) = '',
    @costCenter nvarchar(10) = '',
    @saleAcct nvarchar(20) = '',
    @purchaseAcct nvarchar(20) = '',
    -- @version timestamp,
    -- @createDate nvarchar(100) = '',
    @createUser int = -1,
    -- @lastModified timestamp,
    @modifyUser int = -1,
    @StatementType nvarchar(20) = '',
    
    @newID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- convert datetime from string
	-- SET @createDate = CONVERT(datetime, @createDate);

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'
	BEGIN
	insert into test ( deptName, description, image, bgColor, textColor, costCenter, saleAcct, purchaseAcct, createDate, createUser, modifyUser) values
	(  @deptName, @description, @image, @bgColor, @textColor, @costCenter, @saleAcct, @purchaseAcct, GETDATE(), @createUser, @modifyUser);
	
	SELECT @newID = SCOPE_IDENTITY();
	END
	
	IF @StatementType = 'Select'
	BEGIN
	select * from test
	END
	
	IF @StatementType = 'Update'
	BEGIN
	UPDATE test SET
		deptName = @deptName,
		description = @description, 
		image = @image, 
		bgColor = @bgColor, 
		textColor = @textColor, 
		costCenter = @costCenter, 
		saleAcct = @saleAcct, 
		purchaseAcct = @purchaseAcct, 
		modifyUser = @modifyUser
	WHERE deptId = @deptId
	END
	
	IF @StatementType = 'Delete'
	BEGIN
	DELETE FROM test WHERE deptId = @deptId
	END
END
GO
/****** Object:  Table [dbo].[section]    Script Date: 05/13/2013 08:59:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[section](
	[deptID] [int] NOT NULL,
	[sectionID] [int] IDENTITY(1,1) NOT NULL,
	[sectionName] [varchar](100) NULL,
	[reference] [nvarchar](25) NULL,
	[description] [nvarchar](50) NULL,
	[image] [varchar](100) NULL,
	[bgColor] [nvarchar](20) NULL,
	[textColor] [nvarchar](20) NULL,
	[costCenter] [nvarchar](10) NULL,
	[saleAcct] [nvarchar](20) NULL,
	[purchaseAcct] [nvarchar](20) NULL,
	[version] [timestamp] NULL,
	[createDate] [datetime] NULL,
	[createUser] [int] NULL,
	[lastModified] [datetime] NULL,
	[modifyUser] [int] NULL,
 CONSTRAINT [PK_section] PRIMARY KEY CLUSTERED 
(
	[sectionID] ASC,
	[deptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sectionSelectInsertUpdateDelete]    Script Date: 05/13/2013 08:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sectionSelectInsertUpdateDelete] 
	-- Add the parameters for the stored procedure here
	@deptID INTEGER = -1,
	@sectionID INTEGER = -1,
	@sectionName varchar(100) = '',
	@reference varchar(25) = '',
    @description nvarchar(50) = '',
    @image varchar(100) = '',
    @bgColor nvarchar(20) = '',
    @textColor nvarchar(20) = '',
    @costCenter nvarchar(10) = '',
    @saleAcct nvarchar(20) = '',
    @purchaseAcct nvarchar(20) = '',
    -- @version timestamp,
    -- @createDate nvarchar(100) = '',
    @createUser int = -1,
    -- @lastModified timestamp,
    @modifyUser int = -1,
    @StatementType nvarchar(20) = '',
    
    @newID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- convert datetime from string
	-- SET @createDate = CONVERT(datetime, @createDate);

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'
	BEGIN
	insert into section ( deptID, sectionName, reference, description, image, bgColor, textColor, costCenter, saleAcct, purchaseAcct, createDate, lastModified, createUser, modifyUser) values
	( @deptID, @sectionName, @reference, @description, @image, @bgColor, @textColor, @costCenter, @saleAcct, @purchaseAcct, GETDATE(), GETDATE(), @createUser, @modifyUser);
	
	SELECT @newID = SCOPE_IDENTITY();
	END
	
	IF (@StatementType = 'Select' AND @deptID = -1)
	BEGIN
	select * from section
	END
	
	IF (@StatementType = 'Select' AND @deptID != -1)
	BEGIN
	select * from section where deptID=@deptID
	END
	
	IF (@StatementType = 'Select' AND @deptID != -1 AND @sectionID != -1)
	BEGIN
	select * from section where deptID=@deptID and sectionID=@sectionID
	END
	
	IF @StatementType = 'Update'
	BEGIN
	UPDATE section SET
		deptId = @deptId,
		sectionName = @sectionName,
		reference = @reference,
		description = @description, 
		image = @image, 
		bgColor = @bgColor, 
		textColor = @textColor, 
		costCenter = @costCenter, 
		saleAcct = @saleAcct, 
		purchaseAcct = @purchaseAcct, 
		lastModified = GETDATE(),
		modifyUser = @modifyUser
	WHERE deptId = @deptId and sectionID=@sectionID
	END
	
	IF @StatementType = 'Delete'
	BEGIN
	DELETE FROM section WHERE deptId = @deptId and sectionID=@sectionID
	END
END
GO
/****** Object:  StoredProcedure [dbo].[lineSelectInsertUpdateDelete]    Script Date: 05/13/2013 08:59:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[lineSelectInsertUpdateDelete] 
	-- Add the parameters for the stored procedure here
	@brandID INTEGER = -1,
	@lineID INTEGER = -1,
	@lineName varchar(100) = '',
    @description nvarchar(50) = '',
    -- @image varchar(100) = '',
    -- @bgColor nvarchar(20) = '',
    -- @textColor nvarchar(20) = '',
    -- @costCenter nvarchar(10) = '',
    -- @saleAcct nvarchar(20) = '',
    -- @purchaseAcct nvarchar(20) = '',
    -- @version timestamp,
    -- @createDate nvarchar(100) = '',
    @createUser int = -1,
    -- @lastModified timestamp,
    @modifyUser int = -1,
    @StatementType nvarchar(20) = '',
    
    @newID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- convert datetime from string
	-- SET @createDate = CONVERT(datetime, @createDate);

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'
	BEGIN
	insert into line ( brandID, lineName, description, createDate, lastModified, createUser, modifyUser) values
	( @brandID, @lineName, @description, GETDATE(), GETDATE(), @createUser, @modifyUser);
	
	SELECT @newID = SCOPE_IDENTITY();
	END
	
	IF (@StatementType = 'Select' AND @brandID = -1 AND @lineID = -1)
	BEGIN
	select * from line
	END
	
	IF (@StatementType = 'Select' AND @brandID != -1)
	BEGIN
	select * from line where brandID=@brandID
	END
	
	IF (@StatementType = 'Select' AND @brandID != -1 AND @lineID != -1)
	BEGIN
	select * from line where brandID=@brandID and lineID=@lineID
	END
	
	IF @StatementType = 'Update'
	BEGIN
	UPDATE line SET
		brandID = @brandID,
		lineName = @lineName,
		description = @description, 
		-- image = @image, 
		-- bgColor = @bgColor, 
		-- textColor = @textColor, 
		-- costCenter = @costCenter, 
		-- saleAcct = @saleAcct, 
		-- purchaseAcct = @purchaseAcct,
		lastModified = GETDATE(),
		modifyUser = @modifyUser
	WHERE brandId = @brandId and lineID=@lineID
	END
	
	IF @StatementType = 'Delete'
	BEGIN
	DELETE FROM line WHERE brandId = @brandId and lineID=@lineID
	END
END
GO
/****** Object:  ForeignKey [FK_family_family]    Script Date: 05/13/2013 08:59:36 ******/
ALTER TABLE [dbo].[family]  WITH CHECK ADD  CONSTRAINT [FK_family_family] FOREIGN KEY([deptID], [sectionID], [familyID])
REFERENCES [dbo].[family] ([deptID], [sectionID], [familyID])
GO
ALTER TABLE [dbo].[family] CHECK CONSTRAINT [FK_family_family]
GO
/****** Object:  ForeignKey [FK_brand_line]    Script Date: 05/13/2013 08:59:36 ******/
ALTER TABLE [dbo].[line]  WITH CHECK ADD  CONSTRAINT [FK_brand_line] FOREIGN KEY([brandID])
REFERENCES [dbo].[brand] ([brandID])
GO
ALTER TABLE [dbo].[line] CHECK CONSTRAINT [FK_brand_line]
GO
/****** Object:  ForeignKey [FK_section_department]    Script Date: 05/13/2013 08:59:36 ******/
ALTER TABLE [dbo].[section]  WITH CHECK ADD  CONSTRAINT [FK_section_department] FOREIGN KEY([deptID])
REFERENCES [dbo].[department] ([deptID])
GO
ALTER TABLE [dbo].[section] CHECK CONSTRAINT [FK_section_department]
GO
