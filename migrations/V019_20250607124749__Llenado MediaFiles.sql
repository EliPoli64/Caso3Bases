DECLARE @pdfTypeId INT = (SELECT mediaTypeId FROM dbo.pv_mediaTypes WHERE name = 'PDF');
DECLARE @audioTypeId INT = (SELECT mediaTypeId FROM dbo.pv_mediaTypes WHERE name = 'Audio');
DECLARE @videoTypeId INT = (SELECT mediaTypeId FROM dbo.pv_mediaTypes WHERE name = 'Video');
DECLARE @epubTypeId INT = (SELECT mediaTypeId FROM dbo.pv_mediaTypes WHERE name = 'EPUB');

IF @pdfTypeId IS NULL OR @audioTypeId IS NULL OR @videoTypeId IS NULL OR @epubTypeId IS NULL
BEGIN
    PRINT 'error, no se ha insertado algo';
END
ELSE
BEGIN
    DECLARE @i INT = 1;
    WHILE @i <= 100
    BEGIN
        DECLARE @currentMediaTypeId INT;
        DECLARE @documentURL VARCHAR(300);
        DECLARE @deletedStatus BIT = 0; 

        -- nombres aleatorios para cada file
        IF @i % 4 = 1
        BEGIN
            SET @currentMediaTypeId = @pdfTypeId;
            SET @documentURL = 'https://docs.example.com/proposal-doc-' + RIGHT('00' + CAST(@i AS VARCHAR(2)), 2) + '.pdf';
        END
        ELSE IF @i % 4 = 2
        BEGIN
            SET @currentMediaTypeId = @audioTypeId;
            SET @documentURL = 'https://audio.example.com/meeting-summary-' + RIGHT('00' + CAST(@i AS VARCHAR(2)), 2) + '.mp3';
        END
        ELSE IF @i % 4 = 3
        BEGIN
            SET @currentMediaTypeId = @videoTypeId;
            SET @documentURL = 'https://videos.example.com/project-intro-' + RIGHT('00' + CAST(@i AS VARCHAR(2)), 2) + '.mp4';
        END
        ELSE 
        BEGIN
            SET @currentMediaTypeId = @epubTypeId;
            SET @documentURL = 'https://books.example.com/annual-report-' + RIGHT('00' + CAST(@i AS VARCHAR(2)), 2) + '.epub';
        END

        IF @i % 5 = 0 SET @deletedStatus = 1;

        INSERT INTO dbo.pv_mediaFiles (documentURL, lastUpdate, deleted, mediaTypeId)
        VALUES
        (
            @documentURL,
            DATEADD(day, -(@i * 2), GETDATE()), -- formula para fechas
            @deletedStatus,
            @currentMediaTypeId
        );
        SET @i = @i + 1;
    END;
END
GO