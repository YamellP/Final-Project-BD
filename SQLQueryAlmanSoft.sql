USE [master]
GO
/****** Object:  Database [ALMAN_SOFT]    Script Date: 25/04/2023 09:31:11 p. m. ******/
CREATE DATABASE [ALMAN_SOFT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ALMAN_SOFT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ALMAN_SOFT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ALMAN_SOFT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ALMAN_SOFT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ALMAN_SOFT] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ALMAN_SOFT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ALMAN_SOFT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET ARITHABORT OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ALMAN_SOFT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ALMAN_SOFT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ALMAN_SOFT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ALMAN_SOFT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET RECOVERY FULL 
GO
ALTER DATABASE [ALMAN_SOFT] SET  MULTI_USER 
GO
ALTER DATABASE [ALMAN_SOFT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ALMAN_SOFT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ALMAN_SOFT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ALMAN_SOFT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ALMAN_SOFT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ALMAN_SOFT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ALMAN_SOFT', N'ON'
GO
ALTER DATABASE [ALMAN_SOFT] SET QUERY_STORE = ON
GO
ALTER DATABASE [ALMAN_SOFT] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ALMAN_SOFT]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 25/04/2023 09:31:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](255) NULL,
	[telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_pedido]    Script Date: 25/04/2023 09:31:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_pedido](
	[id] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [float] NOT NULL,
	[producto_id] [int] NOT NULL,
	[pedido_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 25/04/2023 09:31:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[empleado_id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[direccion] [varchar](255) NULL,
	[fecha_nacimiento] [date] NULL,
	[fecha_contratacion] [date] NULL,
	[identificacion] [varchar](20) NULL,
	[departamento_id] [int] NOT NULL,
	[salario_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[empleado_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedidos]    Script Date: 25/04/2023 09:31:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedidos](
	[id] [int] NOT NULL,
	[fecha_pedido] [date] NOT NULL,
	[fecha_entrega] [date] NOT NULL,
	[cliente_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 25/04/2023 09:31:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](255) NULL,
	[precio] [float] NOT NULL,
	[cantidad] [int] NOT NULL,
	[proveedor_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedores]    Script Date: 25/04/2023 09:31:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedores](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](255) NULL,
	[telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salarios]    Script Date: 25/04/2023 09:31:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salarios](
	[salario_id] [int] NOT NULL,
	[salario] [decimal](10, 2) NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NULL,
	[empleado_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[salario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono]) VALUES (1, N'Jose Reyes', N'los alcarrizos', N'8097766776')
GO
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono]) VALUES (2, N'Yamell Guzman', N'los alcarrizos', N'8097766776')
GO
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono]) VALUES (3, N'Erick Camacho', N'los alcarrizos', N'8097766776')
GO
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono]) VALUES (4, N'German Gomez', N'los alcarrizos', N'8097766776')
GO
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono]) VALUES (5, N'Elvis Junior', N'los alcarrizos', N'8097766776')
GO
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono]) VALUES (6, N'Carlos Reyes', N'los alcarrizos', N'8097766776')
GO
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono]) VALUES (7, N'Benito Gonzales', N'los alcarrizos', N'8097766776')
GO
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono]) VALUES (8, N'Juan Rainery', N'los alcarrizos', N'8097766776')
GO
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono]) VALUES (9, N'Eliezer Clase', N'los alcarrizos', N'8097766776')
GO
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono]) VALUES (10, N'Junior Roa', N'los alcarrizos', N'8097766776')
GO
INSERT [dbo].[empleados] ([empleado_id], [nombre], [apellido], [direccion], [fecha_nacimiento], [fecha_contratacion], [identificacion], [departamento_id], [salario_id]) VALUES (1, N'Juan', N'Jimenez', N'Puerto rico', CAST(N'1993-02-12' AS Date), CAST(N'2014-01-05' AS Date), N'00000000000', 1, 18000)
GO
INSERT [dbo].[empleados] ([empleado_id], [nombre], [apellido], [direccion], [fecha_nacimiento], [fecha_contratacion], [identificacion], [departamento_id], [salario_id]) VALUES (2, N'María', N'García', N'España', CAST(N'1990-04-03' AS Date), CAST(N'2012-01-02' AS Date), N'11111111111', 2, 25000)
GO
INSERT [dbo].[empleados] ([empleado_id], [nombre], [apellido], [direccion], [fecha_nacimiento], [fecha_contratacion], [identificacion], [departamento_id], [salario_id]) VALUES (3, N'Carlos', N'Hernández', N'México', CAST(N'1985-06-11' AS Date), CAST(N'2010-01-08' AS Date), N'22222222222', 1, 20000)
GO
INSERT [dbo].[empleados] ([empleado_id], [nombre], [apellido], [direccion], [fecha_nacimiento], [fecha_contratacion], [identificacion], [departamento_id], [salario_id]) VALUES (4, N'Ana', N'López', N'Colombia', CAST(N'1992-10-09' AS Date), CAST(N'2016-03-07' AS Date), N'33333333333', 3, 30000)
GO
INSERT [dbo].[empleados] ([empleado_id], [nombre], [apellido], [direccion], [fecha_nacimiento], [fecha_contratacion], [identificacion], [departamento_id], [salario_id]) VALUES (5, N'Pedro', N'Martínez', N'Argentina', CAST(N'1988-12-01' AS Date), CAST(N'2013-02-04' AS Date), N'44444444444', 2, 22000)
GO
INSERT [dbo].[empleados] ([empleado_id], [nombre], [apellido], [direccion], [fecha_nacimiento], [fecha_contratacion], [identificacion], [departamento_id], [salario_id]) VALUES (6, N'Marta', N'González', N'Chile', CAST(N'1995-01-07' AS Date), CAST(N'2017-12-11' AS Date), N'55555555555', 1, 19000)
GO
INSERT [dbo].[empleados] ([empleado_id], [nombre], [apellido], [direccion], [fecha_nacimiento], [fecha_contratacion], [identificacion], [departamento_id], [salario_id]) VALUES (7, N'Jorge', N'Sánchez', N'Uruguay', CAST(N'1987-01-02' AS Date), CAST(N'2011-02-01' AS Date), N'66666666666', 3, 32000)
GO
INSERT [dbo].[empleados] ([empleado_id], [nombre], [apellido], [direccion], [fecha_nacimiento], [fecha_contratacion], [identificacion], [departamento_id], [salario_id]) VALUES (8, N'Laura', N'Fernández', N'Perú', CAST(N'1990-02-08' AS Date), CAST(N'2015-10-06' AS Date), N'77777777777', 2, 24000)
GO
INSERT [dbo].[empleados] ([empleado_id], [nombre], [apellido], [direccion], [fecha_nacimiento], [fecha_contratacion], [identificacion], [departamento_id], [salario_id]) VALUES (9, N'Ricardo', N'Gómez', N'Brasil', CAST(N'1983-02-05' AS Date), CAST(N'2009-05-09' AS Date), N'88888888888', 1, 18000)
GO
INSERT [dbo].[empleados] ([empleado_id], [nombre], [apellido], [direccion], [fecha_nacimiento], [fecha_contratacion], [identificacion], [departamento_id], [salario_id]) VALUES (10, N'Lucía', N'Pérez', N'Ecuador', CAST(N'1991-03-12' AS Date), CAST(N'2018-08-03' AS Date), N'99999999999', 3, 28000)
GO
INSERT [dbo].[pedidos] ([id], [fecha_pedido], [fecha_entrega], [cliente_id]) VALUES (1, CAST(N'2015-04-03' AS Date), CAST(N'2017-01-12' AS Date), 1)
GO
INSERT [dbo].[pedidos] ([id], [fecha_pedido], [fecha_entrega], [cliente_id]) VALUES (2, CAST(N'2017-05-04' AS Date), CAST(N'2017-01-03' AS Date), 2)
GO
INSERT [dbo].[pedidos] ([id], [fecha_pedido], [fecha_entrega], [cliente_id]) VALUES (3, CAST(N'2017-06-03' AS Date), CAST(N'2018-01-04' AS Date), 3)
GO
INSERT [dbo].[pedidos] ([id], [fecha_pedido], [fecha_entrega], [cliente_id]) VALUES (4, CAST(N'2018-07-03' AS Date), CAST(N'2018-01-05' AS Date), 4)
GO
INSERT [dbo].[pedidos] ([id], [fecha_pedido], [fecha_entrega], [cliente_id]) VALUES (5, CAST(N'2016-08-03' AS Date), CAST(N'2018-01-06' AS Date), 5)
GO
INSERT [dbo].[pedidos] ([id], [fecha_pedido], [fecha_entrega], [cliente_id]) VALUES (6, CAST(N'2012-09-03' AS Date), CAST(N'2019-01-07' AS Date), 6)
GO
INSERT [dbo].[pedidos] ([id], [fecha_pedido], [fecha_entrega], [cliente_id]) VALUES (7, CAST(N'2015-10-03' AS Date), CAST(N'2019-01-07' AS Date), 7)
GO
INSERT [dbo].[pedidos] ([id], [fecha_pedido], [fecha_entrega], [cliente_id]) VALUES (8, CAST(N'2016-11-03' AS Date), CAST(N'2019-01-05' AS Date), 8)
GO
INSERT [dbo].[pedidos] ([id], [fecha_pedido], [fecha_entrega], [cliente_id]) VALUES (9, CAST(N'2017-12-03' AS Date), CAST(N'2019-01-05' AS Date), 9)
GO
INSERT [dbo].[pedidos] ([id], [fecha_pedido], [fecha_entrega], [cliente_id]) VALUES (10, CAST(N'2017-01-03' AS Date), CAST(N'2019-01-02' AS Date), 10)
GO
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [cantidad], [proveedor_id]) VALUES (1, N'SQL server', N'Gestionar base de datos', 1000, 2, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [cantidad], [proveedor_id]) VALUES (2, N'Oracle', N'Desarrollo de aplicaciones', 1500, 3, 2)
GO
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [cantidad], [proveedor_id]) VALUES (3, N'MySQL', N'Administración de servidores', 1200, 1, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [cantidad], [proveedor_id]) VALUES (4, N'PostgreSQL', N'Optimización de consultas', 1800, 2, 3)
GO
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [cantidad], [proveedor_id]) VALUES (5, N'MongoDB', N'Gestión de datos no estructurados', 2000, 1, 2)
GO
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [cantidad], [proveedor_id]) VALUES (6, N'Redis', N'Caching de datos', 800, 3, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [cantidad], [proveedor_id]) VALUES (7, N'MariaDB', N'Migración de bases de datos', 1300, 2, 2)
GO
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [cantidad], [proveedor_id]) VALUES (8, N'Cassandra', N'Almacenamiento masivo de datos', 2200, 3, 3)
GO
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [cantidad], [proveedor_id]) VALUES (9, N'Neo4j', N'Modelado de datos en grafo', 1600, 1, 3)
GO
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [cantidad], [proveedor_id]) VALUES (10, N'SQLite', N'Desarrollo de aplicaciones móviles', 1000, 2, 1)
GO
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [cantidad], [proveedor_id]) VALUES (11, N'DynamoDB', N'Gestión de datos en la nube', 1900, 1, 2)
GO
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono]) VALUES (1, N'RH tech', N'Estados unidos', N'1234456434')
GO
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono]) VALUES (2, N'IT World', N'Japón', N'6574839201')
GO
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono]) VALUES (3, N'Digital HR', N'Alemania', N'4372589102')
GO
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono]) VALUES (4, N'Tech Talent', N'Canadá', N'7839405621')
GO
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono]) VALUES (5, N'HR Connect', N'Australia', N'5263980471')
GO
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono]) VALUES (6, N'People First', N'Reino Unido', N'9273568140')
GO
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono]) VALUES (7, N'HR Dynamics', N'Francia', N'1684927530')
GO
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono]) VALUES (8, N'Tech Recruit', N'India', N'4386975201')
GO
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono]) VALUES (9, N'HR Prodigy', N'España', N'3795408621')
GO
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono]) VALUES (10, N'IT Talent', N'México', N'6148209357')
GO
INSERT [dbo].[salarios] ([salario_id], [salario], [fecha_inicio], [fecha_fin], [empleado_id]) VALUES (1, CAST(12500.50 AS Decimal(10, 2)), CAST(N'2005-12-12' AS Date), CAST(N'2019-11-03' AS Date), 1)
GO
INSERT [dbo].[salarios] ([salario_id], [salario], [fecha_inicio], [fecha_fin], [empleado_id]) VALUES (2, CAST(13000.00 AS Decimal(10, 2)), CAST(N'2007-05-06' AS Date), CAST(N'2021-02-12' AS Date), 2)
GO
INSERT [dbo].[salarios] ([salario_id], [salario], [fecha_inicio], [fecha_fin], [empleado_id]) VALUES (3, CAST(9500.75 AS Decimal(10, 2)), CAST(N'2010-07-09' AS Date), CAST(N'2022-01-11' AS Date), 1)
GO
INSERT [dbo].[salarios] ([salario_id], [salario], [fecha_inicio], [fecha_fin], [empleado_id]) VALUES (4, CAST(14500.25 AS Decimal(10, 2)), CAST(N'2008-06-03' AS Date), CAST(N'2020-02-09' AS Date), 3)
GO
INSERT [dbo].[salarios] ([salario_id], [salario], [fecha_inicio], [fecha_fin], [empleado_id]) VALUES (5, CAST(11200.00 AS Decimal(10, 2)), CAST(N'2011-02-08' AS Date), CAST(N'2023-05-05' AS Date), 2)
GO
INSERT [dbo].[salarios] ([salario_id], [salario], [fecha_inicio], [fecha_fin], [empleado_id]) VALUES (6, CAST(9200.50 AS Decimal(10, 2)), CAST(N'2006-11-01' AS Date), CAST(N'2024-01-10' AS Date), 1)
GO
INSERT [dbo].[salarios] ([salario_id], [salario], [fecha_inicio], [fecha_fin], [empleado_id]) VALUES (7, CAST(17500.00 AS Decimal(10, 2)), CAST(N'2008-01-12' AS Date), CAST(N'2022-01-09' AS Date), 3)
GO
INSERT [dbo].[salarios] ([salario_id], [salario], [fecha_inicio], [fecha_fin], [empleado_id]) VALUES (8, CAST(10500.25 AS Decimal(10, 2)), CAST(N'2013-08-05' AS Date), CAST(N'2025-08-08' AS Date), 2)
GO
INSERT [dbo].[salarios] ([salario_id], [salario], [fecha_inicio], [fecha_fin], [empleado_id]) VALUES (9, CAST(14000.00 AS Decimal(10, 2)), CAST(N'2009-02-11' AS Date), CAST(N'2023-03-04' AS Date), 1)
GO
INSERT [dbo].[salarios] ([salario_id], [salario], [fecha_inicio], [fecha_fin], [empleado_id]) VALUES (10, CAST(9900.50 AS Decimal(10, 2)), CAST(N'2012-01-07' AS Date), CAST(N'2024-06-12' AS Date), 3)
GO
ALTER TABLE [dbo].[detalle_pedido]  WITH CHECK ADD FOREIGN KEY([pedido_id])
REFERENCES [dbo].[pedidos] ([id])
GO
ALTER TABLE [dbo].[detalle_pedido]  WITH CHECK ADD FOREIGN KEY([producto_id])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[clientes] ([id])
GO
USE [master]
GO
ALTER DATABASE [ALMAN_SOFT] SET  READ_WRITE 
GO
