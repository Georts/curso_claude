CREATE PROCEDURE sp_RegistrarTransferencia
    @ctaOrigen varchar(20),
    @ctaDestino varchar(20),
    @monto decimal(18,2)
AS
    DECLARE @saldo decimal(18,2)
    SELECT @saldo = saldo FROM cuentas WHERE nro_cta = @ctaOrigen

    IF @saldo < @monto
    BEGIN
        SELECT 'Saldo insuficiente' AS msg
        RETURN -1
    END

    BEGIN TRANSACTION
    UPDATE cuentas SET saldo = saldo - @monto WHERE nro_cta = @ctaOrigen
    UPDATE cuentas SET saldo = saldo + @monto WHERE nro_cta = @ctaDestino
    INSERT INTO movimientos VALUES (@ctaOrigen, @ctaDestino, @monto, GETDATE(), 'TRF')
    COMMIT TRANSACTION

    SELECT * FROM movimientos WHERE cta_origen = @ctaOrigen
    RETURN 0
GO
