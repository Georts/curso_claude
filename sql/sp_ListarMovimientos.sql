CREATE PROCEDURE sp_ListarMovimientos
    @nroCta varchar(20),
    @desde datetime,
    @hasta datetime
AS
    SELECT * FROM movimientos
    WHERE (cta_origen = @nroCta OR cta_destino = @nroCta)
      AND fecha BETWEEN @desde AND @hasta
    ORDER BY fecha DESC
GO
