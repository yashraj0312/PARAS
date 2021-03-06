if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BudgetInformation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BudgetInformation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CouncilDetails]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CouncilDetails]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EducationalInformation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EducationalInformation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ExperianceInformation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ExperianceInformation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FileInformation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FileInformation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InstituteDetails]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[InstituteDetails]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InstituteProjectInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[InstituteProjectInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[InvestigatorProjectInfo]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[InvestigatorProjectInfo]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LoginDetails]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LoginDetails]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PersonalInformation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PersonalInformation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ProjectInformation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ProjectInformation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ProjectTran]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ProjectTran]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PublicationInformation]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PublicationInformation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ReviewerAssignment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ReviewerAssignment]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ReviewerComments]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ReviewerComments]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ReviewerDetails]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ReviewerDetails]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RoleDetails]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RoleDetails]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[StatusDetails]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[StatusDetails]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UserDetails]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UserDetails]
GO

CREATE TABLE [dbo].[BudgetInformation] (
	[BudgetId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ProjectId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Salary1] [int] NULL ,
	[Salary2] [int] NULL ,
	[Salary3] [int] NULL ,
	[SalaryJustification] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NonRecurring1] [int] NULL ,
	[NonRecurring2] [int] NULL ,
	[NonRecurring3] [int] NULL ,
	[NonRecurringJustification] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Recurring1] [int] NULL ,
	[Recurring2] [int] NULL ,
	[Recurring3] [int] NULL ,
	[RecurringJustification] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Contingency1] [int] NULL ,
	[Contingency2] [int] NULL ,
	[Contingency3] [int] NULL ,
	[ContingencyJustification] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TaDa1] [int] NULL ,
	[TaDa2] [int] NULL ,
	[TaDa3] [int] NULL ,
	[TaDaJustification] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Status] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[CouncilDetails] (
	[CouncilId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CouncilName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CouncilHeadName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CouncilAddress] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CouncilPhone] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CouncilEmail] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CouncilWebsite] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CouncilDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CreationDate] [datetime] NULL ,
	[CreationBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ModificationDate] [datetime] NULL ,
	[ModificationBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[EducationalInformation] (
	[EduInfoId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[UserId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Degree] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PassingYear] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Division] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[University] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ExperianceInformation] (
	[ExpInfoId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[UserId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NoOfYear] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Organization] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NatureOfJob] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FileInformation] (
	[FileId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ProjectId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FileSize] [int] NULL ,
	[FileType] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[UploadDate] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[InstituteDetails] (
	[InstituteId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InstituteCode] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InstituteName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InstituteAddress] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InstitutePhone] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InstituteEmail] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CreationDate] [datetime] NULL ,
	[CreationBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ModificationDate] [datetime] NULL ,
	[ModificationBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[InstituteProjectInfo] (
	[IpiId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[InstituteId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProjectTitle] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InceptionDate] [datetime] NULL ,
	[CompletionDate] [datetime] NULL ,
	[TotalCost] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[GrantReceived] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PiName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProjectStatus] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProjectUc] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[GrantingAgency] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[InvestigatorProjectInfo] (
	[ProjInfoId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[UserId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProjTitle] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProjType] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[LoginDetails] (
	[UserId] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoginId] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[LoginPassword] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PasswordKey] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PasswordIv] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Status] [bit] NOT NULL ,
	[LastLoginDate] [datetime] NULL ,
	[LastPasswordChangedDate] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PersonalInformation] (
	[PId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[UId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InstituteId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PDob] [datetime] NULL ,
	[PGender] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PDesignation] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PSpeialization] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PAddress] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PPhone] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PEmail] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ProjectInformation] (
	[ProjectId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[UserId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CouncilId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProjectCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Title] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Duration] [int] NULL ,
	[Objectives] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Methodology] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Outcome] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Summary] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Usefulness] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IprValue] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[TranslationalValue] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Utilization] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SubmissionDate] [datetime] NULL ,
	[Status] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ProjectTran] (
	[PTranId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ProjectId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Status] [int] NULL ,
	[TranDate] [datetime] NULL ,
	[TranBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[PublicationInformation] (
	[PubInfoId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[UserId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Title] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Journal] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PubYear] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ReviewerAssignment] (
	[AssignmentId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ReviewerId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ProjectId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AssignedDate] [datetime] NULL ,
	[CompletedDate] [datetime] NULL ,
	[Status] [bit] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ReviewerComments] (
	[CommentId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ReviewerId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ProjectId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Originality] [int] NULL ,
	[Innovation] [int] NULL ,
	[Applicability] [int] NULL ,
	[Usefulness] [int] NULL ,
	[Budget] [int] NULL ,
	[Recommendation] [bit] NULL ,
	[Comments] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PecWeight] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ReviewerDetails] (
	[ReviewerId] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Qualification] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Experience] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Expertise] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Phone] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Email] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Address] [varchar] (70) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CreationDate] [datetime] NULL ,
	[ModificationDate] [datetime] NULL ,
	[CreationBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ModificationBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RoleDetails] (
	[RoleId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[RoleName] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[RoleDescription] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CreationDate] [datetime] NULL ,
	[CreationBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ModificationDate] [datetime] NULL ,
	[ModificationBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[StatusDetails] (
	[StatusId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[StatusName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[StatusDescription] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CreationDate] [datetime] NULL ,
	[CreationBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ModificationDate] [datetime] NULL ,
	[ModificationBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[UserDetails] (
	[UserId] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[UserName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[UserRole] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoginId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoginPassword] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PasswordKey] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PasswordIv] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoginStatus] [bit] NULL ,
	[Email] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PhoneNo] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastLoginDate] [datetime] NULL ,
	[LastPasswordChangeDate] [datetime] NULL ,
	[CreationDate] [datetime] NULL ,
	[ModificationDate] [datetime] NULL ,
	[CreationBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ModificationBy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

