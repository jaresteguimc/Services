--CREATE TABLE [dbo].[cliente](
--	IdCliente int identity (1,1),
--	DNI INT primary key,
--	Nombres VARCHAR(250),
--	FechaNacimiento DATETIME,
--	SaldoDisponible MONEY,
--	PuntosAcumulados INT,
--	Estado int
--)
--GO
--create table Bonos
--(
--	IdBono int identity(1,1),
--	DNI INT,
--	CONSTRAINT fk_Clientes FOREIGN KEY (DNI) REFERENCES [cliente] (DNI),
--	Bono MONEY,
--	Estado int
--)

ALTER PROCEDURE [dbo].[SP_Cliente]
(@pOpcion    INT,
 @pParametro VARCHAR(MAX)
)
AS

     BEGIN
	    SET NOCOUNT ON;

		DECLARE @IdCliente int;
		DECLARE @DNI INT;
		DECLARE @Nombres VARCHAR(250);
		DECLARE @FechaNacimiento DATETIME;

		DECLARE @SaldoDisponible MONEY;
		DECLARE @PuntosAcumulados INT;
		DECLARE @Estado int;
		DECLARE @Bono MONEY;
		DECLARE @BonoActual MONEY;
		DECLARE @PuntoActual INT;
		
			 DECLARE @indicador int = 0;
         DECLARE @tParametro TABLE
         (id INT,valor VARCHAR(MAX)
         );
         BEGIN
             IF(LEN(LTRIM(RTRIM(@pParametro))) > 0)
                 BEGIN
                     INSERT INTO @tParametro (id, valor )SELECT ids, data FROM [dbo].[StringListjs_v2](@pParametro, '|');
             END;
         END;
         IF(@pOpcion = 0)
             BEGIN	
			SELECT IdCliente, DNI, Nombres, FechaNacimiento, SaldoDisponible, PuntosAcumulados, Estado 
			FROM [dbo].[cliente]

         END;
             ELSE
         IF(@pOpcion = 1)
             BEGIN
			 BEGIN TRY  
     DECLARE @añoActual int;
			DECLARE @anioNacimiento int;
			DECLARE @edad int;
			set @DNI  = (select valor from @tParametro where id = 1);
			  set @Nombres  = (select valor from @tParametro where id = 2);
		      set @FechaNacimiento  = (select valor from @tParametro where id = 3);
			
			SET @añoactual = year(getdate());
			--SET @FechaNacimiento ='12/07/1968';
			SET @anioNacimiento = year(@FechaNacimiento);			
			SET @edad =@añoActual-@anioNacimiento;
			

			 IF(@edad <=40)
			 BEGIN
			 set @PuntosAcumulados = 1000;
			 END
			 ELSE IF(@edad > 40)
			 BEGIN
			 set @PuntosAcumulados = 100;
			 END;;
			 --select @añoActual;
			 --select @anioNacimiento;
			 --select @edad;
			 --select  @PuntosAcumulados;

			

			 INSERT INTO [dbo].[cliente](DNI, Nombres, FechaNacimiento, SaldoDisponible, PuntosAcumulados, Estado)
			 VALUES(@DNI,@Nombres,@FechaNacimiento,0,@PuntosAcumulados,1);

			 set @indicador =(select  scope_identity());
			 IF(@indicador <> 0) 
			 begin
				SELECT 'ok' as mensaje; 		 
			end;

END TRY  

BEGIN CATCH  
    SELECT 'error' as mensaje; 		
END CATCH 
			

         END;
	    ELSE
         IF(@pOpcion = 2)
             BEGIN
			 

         BEGIN TRY  
     set @DNI  = (select valor from @tParametro where id = 1);
			  set @Bono  = (select valor from @tParametro where id = 2);
				IF(@Bono >=1000)
				BEGIN
				set @PuntosAcumulados = 200;
				END
				ELSE IF(@Bono<1000)
				BEGIN
				set @PuntosAcumulados = 50;				
				END;

				  

			  set @BonoActual =(select top 1[SaldoDisponible] from[dbo].[cliente] WHERE DNI=@DNI);
			  set @PuntoActual =(select top 1 [PuntosAcumulados] from[dbo].[cliente] WHERE DNI=@DNI);

			  set @BonoActual = @BonoActual + @Bono;
			  set @PuntoActual = @PuntoActual + @PuntosAcumulados;


INSERT INTO [dbo].[Bonos](DNI, Bono, Estado)VALUES(@DNI,@Bono,1);
UPDATE [dbo].[cliente] SET [SaldoDisponible] =@BonoActual,[PuntosAcumulados]=@PuntoActual WHERE DNI=@DNI;

			 set @indicador =(select  scope_identity());
			 IF(@indicador <> 0) 
			 begin
				SELECT 'ok' as mensaje; 		 
			end;
END TRY  
BEGIN CATCH  
     SELECT 'error' as mensaje; 
END CATCH 
         END;	   
	    END;