create database senai_bp;

use senai_bp;

create table cursos (
cod_curso int,
nome_curso varchar (100),
primary key (cod_curso)
);

create table alunos (
cod_aluno int,
nome varchar (45),
sobrenome varchar (45),
data_nascimento date,
cod_curso int,
primary key (cod_aluno),
foreign key (cod_curso) references cursos (cod_curso)
);

insert into cursos 
(cod_curso, nome_curso)
values
(101, 'Introdução ao Desenvolvimento de Projetos'),
(102, 'Inglês Técnico Aplicado ao Desenvolvimento de Sistemas'),
(103, 'Higiene do Alimento: Microbiologia de Alimentos'),
(104, 'Ferramentas Digitais de Gestão'),
(105, 'Introdução a IOT para manutenção Industrial'),
(106,'Introdução à Indústria 4.0'),
(107,'Administrador de Banco de Dados');

insert into alunos
values
(1100, 'Marcelo', 'Fonseca', '2004-8-31', '107');


select cod_aluno, concat (nome,' ' ,sobrenome) as 'Nome Completo', data_nascimento
from alunos
where data_nascimento >= '1999-01-01'
order by data_nascimento;

select count(cod_aluno)
from alunos
where data_nascimento >= '2005-08-17'
order by data_nascimento;

select count(cod_curso)
from cursos;

select c.cod_curso, c.nome_curso, count(a.cod_curso) as alunos
from alunos a
inner join cursos c on c.cod_curso = a.cod_curso
group by c.cod_curso;

select a.cod_aluno, concat ( a.nome, ' ', a.sobrenome ) as 'Nome Completo', c.cod_curso
from alunos a
inner join cursos c on c.cod_curso = a.cod_curso
where c.cod_curso = 106;