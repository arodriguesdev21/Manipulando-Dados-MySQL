-- 1.3 Qual foi o primeiro ano de cerimônia do Oscar registrado na base?
-- R: 1928

SELECT ano_cerimonia
FROM oscar_indicados
ORDER BY ano_cerimonia ASC
LIMIT 1;

-- 1.4 Qual foi o último ano de cerimônia registrado na base?
-- R: 2024

SELECT DISTINCT ano_cerimonia FROM oscar_indicados;

-- 1.5 Quantas cerimônias do Oscar estão registradas no total?
-- R: 96

SELECT COUNT(DISTINCT edicao_cerimonia) FROM oscar_indicados;

-- 1.6 Atualize os registros da tabela com os dados do Oscar 2025 e 2026 (pesquise os vencedores e adicione-os).

INSERT INTO oscar_indicados (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_indicado, nome_filme, vencedor)
VALUES (2024, 2025, 97, "Melhor Filme", "Produção de The Brutalist" , "The Brutalist", 0);
INSERT INTO oscar_indicados (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_indicado, nome_filme, vencedor)
VALUES (2024, 2025, 97, "Melhor Filme", "Produção de Wicked" , "Wicked", 0);
INSERT INTO oscar_indicados (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_indicado, nome_filme, vencedor)
VALUES (2024, 2025, 97, "Melhor Ator", "Adrien Brody" , "The Brutalist", 1);
INSERT INTO oscar_indicados (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_indicado, nome_filme, vencedor)
VALUES (2024, 2025, 97, "Melhor Ator", "Timothée Chalamet" , "A Complete Unknown", 0);
INSERT INTO oscar_indicados (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_indicado, nome_filme, vencedor)
VALUES (2024, 2025, 97, "Melhor Atriz", "Mikey Madison" , "Anora", 1);
INSERT INTO oscar_indicados (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_indicado, nome_filme, vencedor)
VALUES (2024, 2025, 97, "Melhor Atriz", "Demi Moore" , "The Substance", 0);
INSERT INTO oscar_indicados (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_indicado, nome_filme, vencedor)
VALUES (2024, 2025, 97, "Melhor Atriz", "Fernanda Torres" , "I am still here", 0);
INSERT INTO oscar_indicados (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_indicado, nome_filme, vencedor)
VALUES (2024, 2025, 97, "Melhor Direção", "Sean Baker" , "Anora", 1);
INSERT INTO oscar_indicados (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_indicado, nome_filme, vencedor)
VALUES (2024, 2025, 97, "Melhor Direção", "Brady Corbet" , "The Brutalist", 0);
INSERT INTO oscar_indicados (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_indicado, nome_filme, vencedor)
VALUES (2024, 2025, 97, "Melhor Atriz Coadjuvante", "Zoe Saldaña" , "Emilia Pérez", 0);
INSERT INTO oscar_indicados (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_indicado, nome_filme, vencedor)
VALUES (2024, 2025, 97, "Melhor Atriz Coadjuvante", "Kieran Culkin" , "A Real Pain", 0);
INSERT INTO oscar_indicados (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_indicado, nome_filme, vencedor)
VALUES (2024, 2025, 97, "Melhor Fotografia", "Lol Crawley" , "The Brutalist", 1);
INSERT INTO oscar_indicados (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_indicado, nome_filme, vencedor)
VALUES (2024, 2025, 97, "Melhor Figurino", "Paul Tazewell" , "Wicked", 1);

-- 2.1 Quantas indicações existem para cada categoria? Agrupe por categoria e ordene da mais frequente para a menos frequente.

SELECT categoria, 
  COUNT(*) AS total_indicacoes
FROM oscar_indicados
GROUP BY categoria
ORDER BY total_indicacoes DESC;

-- 2.2 Qual categoria teve mais indicações ao longo da história do Oscar?

-- R: Categoria DIRECTING.

SELECT categoria, 
  COUNT(*) AS total_indicacoes
FROM oscar_indicados
GROUP BY categoria
ORDER BY total_indicacoes DESC
LIMIT 1;

-- 2.3 Qual categoria teve menos indicações ao longo da história?

-- R: Categorias SPECIAL ACHIEVEMENT AWARD (Sound Effects), AWARD OF COMMENDATION, Melhor Fotografia, Melhor Figurino.
-- O comando LIMIT foi colocado como 10, porque há mais categorias com apenas uma indicação.

SELECT categoria, 
  COUNT(*) AS total_indicacoes
FROM oscar_indicados
GROUP BY categoria
ORDER BY total_indicacoes ASC
LIMIT 10;

-- 2.4 A partir de que ano a categoria "ACTRESS" deixou de existir? (Dica: procure a última cerimônia com essa categoria)
-- R: Em todos os anos de oscar há a categoria atriz e o último ano foi em 2025.


SELECT categoria, MAX(ano_cerimonia)
FROM oscar_indicados
WHERE categoria LIKE '%ACTRESS%' 
OR categoria LIKE '%Atriz%'
GROUP BY categoria;

-- 2.5 Quais categorias existiam na primeira cerimônia (1928) e não existem mais hoje?
-- R: Foi comparada ao ano de 2024 devido ao ano de 2025 não estar totalmente completo.
-- Nessa query, é extraido todas as categorias do ano de 1928 e depois comparado a de 2024.

SELECT DISTINCT categoria
FROM oscar_indicados
WHERE ano_cerimonia = 1928
  AND categoria NOT IN (
    SELECT DISTINCT categoria
    FROM oscar_indicados
    WHERE ano_cerimonia = 2024
  );

-- 2.6 Liste todas as categorias que contêm a palavra "DIRECTING" no nome.
-- R: É usada a palavra LIKE porque abrange todas categorias que tem a palavra DIRECTING no registro.

SELECT categoria 
FROM oscar_indicados 
WHERE categoria LIKE '%DIRECTING%';

-- 3.1 Quantas vezes Natalie Portman foi indicada ao Oscar?
-- R: 3

SELECT COUNT(*) nome_indicado
FROM oscar_indicados
WHERE nome_indicado LIKE '%Natalie Portman%';

-- 3.2 Quantos Oscars Natalie Portman ganhou?
--R: 1

SELECT COUNT(*) nome_indicado, vencedor
FROM oscar_indicados
WHERE nome_indicado LIKE '%Natalie Portman%'
and vencedor = 1;

-- 3.3 Em quais anos e por quais filmes Natalie Portman foi indicada?
-- R: 2005 (Filme Closer), 2011 (Black Swan), 2017 (Jackie)

SELECT ano_cerimonia, nome_indicado, nome_filme
FROM oscar_indicados
WHERE nome_indicado LIKE '%Natalie Portman%';

-- 3.4 Liste todas as indicações de Natalie Portman mostrando: ano, categoria, filme e se venceu.
-- R: Apenas em 2005 que ela foi coadjuvante, porém não venceu. Em 2011 ela foi a protagonista e venceu
SELECT ano_cerimonia, categoria, nome_indicado, nome_filme, vencedor
FROM oscar_indicados
WHERE nome_indicado LIKE '%Natalie Portman%';	

-- 3.7 Por quais filmes Viola Davis foi indicada?
-- R: Doubt, The Help, Fences, Ma Rainey's Black Bottom.

SELECT nome_filme, nome_indicado
FROM oscar_indicados
WHERE nome_indicado LIKE '%Viola Davis%';

-- 3.8 Amy Adams já ganhou algum Oscar?
-- R: Não.

SELECT nome_indicado, vencedor
FROM oscar_indicados
WHERE nome_indicado LIKE '%Amy Adams%'
and vencedor = 1;

-- 3.9 Quantas vezes Amy Adams foi indicada sem ganhar?
-- R: 6

SELECT COUNT(*) nome_indicado
FROM oscar_indicados
WHERE nome_indicado LIKE '%Amy Adams%';

-- 3.10 Denzel Washington já ganhou algum Oscar?
-- R: Sim, duas vezes.

SELECT nome_indicado, vencedor
FROM oscar_indicados
WHERE nome_indicado LIKE '%Denzel Washington'
and vencedor = 1;

-- 3.11 Quantas vezes Denzel Washington foi indicado ao Oscar?
-- R: 9

SELECT COUNT(*) nome_indicado
FROM oscar_indicados
WHERE nome_indicado LIKE '%Denzel Washington';

-- 3.12 Liste todos os Oscars que Denzel Washington ganhou (ano, categoria, filme).
-- R: Ele ganhou no filme "Glory" atuando como coadjuvante e no filme "Training Day" como protagonista.

SELECT nome_indicado, categoria, nome_filme, vencedor
FROM oscar_indicados
WHERE nome_indicado LIKE '%Denzel Washington'
and vencedor = 1;

-- 4.1 Quem ganhou o primeiro Oscar para Melhor Atriz (ACTRESS)? Em que ano e por qual filme?
-- R: Janet Gaynor, atuando no filme "7th Heaven" em 1928.

SELECT nome_indicado, nome_filme, ano_cerimonia
FROM oscar_indicados
WHERE categoria LIKE '%ACTRESS%' 
AND vencedor = 1
ORDER BY ano_cerimonia ASC
LIMIT 1;

-- 4.2 Quem ganhou o primeiro Oscar para Melhor Ator (ACTOR)? Em que ano e por qual filme?
-- R: Emil Jannings, atuando no filme "The Last Command" em 1928.

SELECT nome_indicado, nome_filme, ano_cerimonia
FROM oscar_indicados
WHERE categoria LIKE '%ACTOR%' 
AND vencedor = 1
ORDER BY ano_cerimonia ASC
LIMIT 1;

-- 4.3 Quantos vencedores existem ao todo na base de dados?
--R: 2471 vencedores.

SELECT COUNT(*)
FROM oscar_indicados
WHERE vencedor = 1;

-- 4.4 Liste todos os filmes que ganharam o Oscar de Melhor Filme (categoria "OUTSTANDING PICTURE" ou "BEST PICTURE").

SELECT nome_filme, categoria, vencedor
FROM oscar_indicados
WHERE (categoria = "BEST PICTURE"
OR categoria = "OUTSTANDING PICTURE")
and vencedor = 1;

-- 4.5 Quantos filmes diferentes já ganharam o Oscar?
-- R: 1331

SELECT COUNT(DISTINCT nome_filme)
FROM oscar_indicados
WHERE vencedor = 1;

-- 5.1 Quais atores/atrizes foram indicados mais de uma vez? Liste o nome e o número de indicações.

SELECT nome_indicado, 
COUNT(*) AS total_indicacoes
FROM oscar_indicados
WHERE nome_indicado IS NOT NULL
GROUP BY nome_indicado
HAVING COUNT(*) > 1
ORDER BY total_indicacoes DESC;

-- 5.2 Qual ator ou atriz tem o maior número de indicações na história do Oscar?
-- R: Katharine Hepburn e Bette Davis tiveram 11 indicações.

SELECT nome_indicado,
COUNT(*) AS total_indicacoes
FROM oscar_indicados
WHERE categoria = 'ACTOR'
OR categoria = 'ACTRESS'
GROUP BY nome_indicado
HAVING COUNT(*) > 1
ORDER BY total_indicacoes DESC;

-- 5.3 Quais atores foram indicados mais de 3 vezes, mas nunca ganharam?
-- R: Charles Boyer	(4), Mickey Rooney (4), Claude Rains (4), Montgomery Clift (4), Arthur Kennedy (5)...

SELECT nome_indicado,
COUNT(*) AS total_indicacoes
FROM oscar_indicados
WHERE (categoria = 'ACTOR'
OR categoria = 'ACTRESS')
AND nome_indicado IS NOT NULL
GROUP BY nome_indicado
HAVING COUNT(*) >= 3
AND SUM(vencedor) = 0;

-- 5.4 Encontre todos os artistas que foram indicados em categorias diferentes (ex: ator e diretor).
SELECT nome_indicado,
COUNT(DISTINCT categoria) AS total_categorias
FROM oscar_indicados
WHERE nome_indicado IS NOT NULL
GROUP BY nome_indicado
HAVING COUNT(DISTINCT categoria) > 1;

-- 5.5 Quantos indicados têm exatamente 1 indicação na história?
-- R: 5591.

SELECT COUNT(*) AS total_artistas
FROM (
  SELECT nome_indicado
  FROM oscar_indicados
  WHERE nome_indicado IS NOT NULL
  GROUP BY nome_indicado
  HAVING COUNT(*) = 1
) AS sub; 

-- 5.6 Qual o maior números de indicados em um único ano? Essa é uma pergunta franca.
-- R: 186, em 1943.

SELECT ano_cerimonia, 
COUNT(*) AS total_indicados
FROM oscar_indicados
GROUP BY ano_cerimonia
ORDER BY total_indicados DESC
LIMIT 1;

-- 6.1 A série de filmes Toy Story ganhou Oscars em quais anos?
-- R: 2011 e 2020.

SELECT ano_cerimonia, nome_filme, vencedor
FROM oscar_indicados
WHERE nome_filme LIKE '%Toy Story%'
AND vencedor = 1;


-- 6.2 Quantas indicações a franquia Toy Story recebeu no total?
-- R: 11.

SELECT COUNT(*) nome_filme
FROM oscar_indicados
WHERE nome_filme LIKE '%Toy Story%';

-- 6.3 Em quais categorias os filmes Toy Story foram indicados?
-- R: MUSIC (Original Musical or Comedy Score), MUSIC (Original Song), WRITING (Screenplay Written Directly for the Screen), ANIMATED FEATURE FILM, BEST PICTURE, SOUND EDITING, WRITING (Adapted Screenplay)

SELECT DISTINCT(categoria)
FROM oscar_indicados
WHERE nome_filme LIKE '%Toy Story%';

-- 6.4 Em qual edição do Oscar o filme "Crash" concorreu?
-- R: 2006.

SELECT nome_filme, ano_cerimonia
FROM oscar_indicados
WHERE nome_filme = "CRASH";

-- 6.5 Quantas indicações o filme "Crash" recebeu?
-- R: ACTOR IN A SUPPORTING ROLE, DIRECTING, FILM EDITING, MUSIC (Original Song), BEST PICTURE, WRITING (Original Screenplay)

SELECT nome_filme, ano_cerimonia, categoria
FROM oscar_indicados
WHERE nome_filme = "CRASH";

-- 6.6 "Crash" ganhou o Oscar de Melhor Filme?
-- R: Sim.

SELECT nome_filme, ano_cerimonia, categoria, vencedor
FROM oscar_indicados
WHERE nome_filme = "CRASH"
AND vencedor = 1;

-- 6.7 O filme "Central do Brasil" aparece no banco de dados?
-- R: Não
SELECT * FROM oscar_indicados
WHERE nome_filme = "Central do Brasil";