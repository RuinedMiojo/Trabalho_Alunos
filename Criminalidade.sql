create database criminalidade_sp;

use criminalidade_sp;

create table boletim_ocorrencia (
num_bo char(10),
ano_bo int,
id_delegacia int,
nome_departamento varchar(45),
delegacia varchar(45),
mes int,
rubrica varchar(100),
conduta varchar(45),
cidade varchar(45),
logradouro varchar(60)
);

select nome_departamento, count(num_bo)
from boletim_ocorrencia
group by nome_departamento;

select delegacia, count(num_bo) as total_ocorrencia
from boletim_ocorrencia
group by delegacia
order by total_ocorrencia desc
limit 5;

select mes, count(num_bo) as total_ocorrencia
from boletim_ocorrencia
group by mes
order by total_ocorrencia desc
limit 1;

select rubrica, count(rubrica) as total_ocorrencia
from boletim_ocorrencia
group by rubrica
order by total_ocorrencia desc;

select logradouro, count(rubrica) as total_furtos
from boletim_ocorrencia
where rubrica like '%furto%'
group by rubrica
limit 1;

select ano_bo, count(num_bo), cidade
from boletim_ocorrencia
where cidade = 'S.Paulo'
group by ano_bo;

select cidade, ano_bo 
from boletim_ocorrencia
where ano_bo = '2016'
group by cidade;