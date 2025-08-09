USE locadoraveiculos;

/* Implemente uma consulta para listar a descrição, 
a data e o custo de todas as manutenções realizadas nos veículos*/
SELECT descricao, dataManutencao, custo
FROM Manutencao;

/*Implemente uma consulta para listar o valor total arrecadado pela locadora. 
Lembre-se que pagamentos “pendentes” não fazem parte da soma.*/

SELECT SUM(valorTotal) FROM pagamento
WHERE estado = 'Pago';

/*Implemente uma consulta para listar o modelo e a marca dos veículos, 
bem como o número de vezes que cada um foi locado. 
A listagem deve ser mostrada em ordem decrescente pelo número de aluguéis.
Dica: Utilize a cláusula group by.*/

SELECT veiculo.marca, veiculo.modelo, 
COUNT(LocacaoVeiculo.idVeiculo) AS totalDeLocacao
FROM veiculo
INNER JOIN LocacaoVeiculo ON veiculo.idVeiculo = LocacaoVeiculo.idVeiculo
GROUP BY veiculo.marca, veiculo.modelo
ORDER BY totalDeLocacao DESC;

/*Implemente uma consulta para listar o nome dos clientes que possuem pagamento “pendente”, bem como o valor devido por eles. 
A listagem deve ser mostrada em ordem alfabética crescente pelo nome dos clientes.
Dica: Utilize a cláusula group by.
*/

SELECT cliente.nome,
SUM(pagamento.valorTotal) AS valorPendente
FROM cliente
JOIN locacao ON cliente.idCliente = locacao.idCliente
JOIN pagamento ON locacao.idPagamento = pagamento.idPagamento
WHERE pagamento.estado = 'pendente'
GROUP BY cliente.nome
ORDER BY cliente.nome;
