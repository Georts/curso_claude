CREATE PROCEDURE sp_ConsultarSaldo
    @nroCta varchar(20)
AS
    SELECT * FROM cuentas WHERE nro_cta = @nroCta
GO
