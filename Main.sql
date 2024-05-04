-- Criar tabela de Autores
CREATE TABLE Autores (
    autor_id INT PRIMARY KEY,
    nome VARCHAR(100)
);

-- Criar tabela de Livros
CREATE TABLE Livros (
    livro_id INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor_id INT,
    ano_publicacao INT,
    preco DECIMAL(10, 2),
    FOREIGN KEY (autor_id) REFERENCES Autores(autor_id)
);

-- Inserir dados na tabela Autores
INSERT INTO Autores (autor_id, nome) VALUES (1, 'J.K. Rowling');
INSERT INTO Autores (autor_id, nome) VALUES (2, 'George Orwell');

-- Inserir dados na tabela Livros
INSERT INTO Livros (livro_id, titulo, autor_id, ano_publicacao, preco) VALUES (1, 'Harry Potter e a Pedra Filosofal', 1, 1997, 19.90);
INSERT INTO Livros (livro_id, titulo, autor_id, ano_publicacao, preco) VALUES (2, '1984', 2, 1949, 29.90);

-- Consulta para selecionar todos os livros
SELECT * FROM Livros;

-- Consulta para encontrar livros de George Orwell
SELECT L.titulo, L.ano_publicacao, L.preco FROM Livros L
JOIN Autores A ON L.autor_id = A.autor_id
WHERE A.nome = 'George Orwell';

-- Consulta para calcular o preço médio dos livros
SELECT AVG(preco) AS PrecoMedio FROM Livros;

-- Atualizar o preço do livro '1984'
UPDATE Livros SET preco = 24.90 WHERE livro_id = 2;

-- Excluir autor e seus livros (Excluir os livros primeiro devido à chave estrangeira)
DELETE FROM Livros WHERE autor_id = 1;
DELETE FROM Autores WHERE autor_id = 1;
