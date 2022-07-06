USE ATIVIDADE4;

SELECT *
  FROM autor;
  
SELECT *
  FROM biblioteca;
  
SELECT *
  FROM biblioteca;
  
 SELECT *
  FROM leitores; 

SELECT *
  FROM leitura;

SELECT *
  FROM livros;
  
SELECT nome_autor, titulo_livro, editora, data_lancamento 
  FROM autor
  JOIN livros ON autor.autor_id = livros.livro_id;



# view --mostra os os autores com seus livros agrupados por autor (caso tenha mais)
CREATE VIEW LivrosAutores AS
SELECT livros.titulo_livro AS Livro,
autor.nome_autor AS Autor
FROM livros
JOIN autor ON livros.livro_id = autor.autor_id;

Select *
FROM LivrosAutores
GROUP BY Autor;



# procedure -- deleta livros pelo nome do livro
DELIMITER //
CREATE PROCEDURE delete_livros (IN p_valor1 VARCHAR(50))
BEGIN
	SET @p_nome_livro = p_valor1;
    DELETE FROM livros
    WHERE titulo_livro = (@p_nome_livro);
END //
DELIMITER ;

CALL delete_livros("O esquadrão");



# function -- obter o nome do auor pelo id
DELIMITER //
CREATE FUNCTION obterNomeAutorPorID(p_cod_autor INT(11))
RETURNS VARCHAR (100)
DETERMINISTIC 
	BEGIN
		DECLARE n_autor VARCHAR(100);
		IF(p_cod_autor IS NOT NULL) THEN
			SELECT autor.nome_autor
			INTO n_autor
			FROM autor
			WHERE autor.autor_id = p_cod_autor;
		END IF;
		
        RETURN n_autor;
	END //
DELIMITER ;



# trigger -- deletar tabela
DELIMITER //
CREATE TRIGGER del_table_livros BEFORE INSERT ON livros
FOR EACH ROW
BEGIN
DELETE FROM livros;
END //
DELIMITER ; 



#event -- apagar dados da tabela uma vez por ano às 00:00
SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE EVENT limparTabela 
    ON SCHEDULE EVERY 365 DAY
    STARTS '2014-11-22 23:59:59' 
    DO BEGIN 
        DELETE FROM livros; 
    END //
DELIMITER ;

SELECT * FROM INFORMATION_SCHEMA.EVENTS
   WHERE EVENT_NAME = 'limparTabela'
     AND EVENT_SCHEMA = 'atividade4github';