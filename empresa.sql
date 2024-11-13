-- Criação da tabela empregado
CREATE TABLE empregado (
    nome            VARCHAR(30) NOT NULL,
    rg              NUMBER NOT NULL,
    cic             NUMBER NOT NULL,
    depto           NUMBER NOT NULL,
    rg_supervisor   NUMBER,
    salario         NUMBER(10, 2) NOT NULL  
);

-- Adicionando chave primária rg para a tabela empregado
ALTER TABLE empregado ADD CONSTRAINT empregado_pk PRIMARY KEY ( rg );

-- Criação da tabela departamento 
CREATE TABLE departamento (
    nome            VARCHAR(30) NOT NULL,
    numero          NUMBER NOT NULL,
    rg_gerente      NUMBER NOT NULL
);

-- Adicionando chave primária numero para a tabela departamento 
ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( numero );

-- Criação da tabela projeto 
CREATE TABLE projeto (
    nome            VARCHAR(30) NOT NULL,
    numero          NUMBER NOT NULL,
    localizacao     VARCHAR(30) NOT NULL
)

-- Adicionando chave primária numero para a tabela projeto 
ALTER TABLE projeto ADD CONSTRAINT projeto_pk PRIMARY KEY ( numero );

-- Criação da tabela dependentes 
CREATE TABLE dependentes (
    rg_responsavel  NUMBER NOT NULL,
    nome_dependente VARCHAR(30) NOT NULL,
    nascimento      DATE NOT NULL,
    relacao         VARCHAR(30) NOT NULL,
    sexo            VARCHAR(15) NOT NULL
);  

-- Adicionando chave primária nome_dependente para a tabela dependentes 
ALTER TABLE dependentes ADD CONSTRAINT dependentes_pk PRIMARY KEY ( nome_dependente );

-- Criação da tabela departamento_projeto 
CREATE TABLE departamento_projeto (
    numero_depto NUMBER(2) NOT NULL,
    numero_projeto NUMBER(2) NOT NULL,
    PRIMARY KEY(numero_depto, numero_projeto)
)

-- Criação da tabela empregado_projeto 
CREATE TABLE empregado_projeto (
    rg_empregado NUMBER NOT NULL,
    numero_projeto NUMBER(2) NOT NULL,
    horas NUMBER NOT NULL,
    PRIMARY KEY(rg_empregado, numero_projeto)
)

-- Inserção de instâncias de empregado
INSERT INTO empregado VALUES ('João Luiz', 10101010, 11111111, 1, NULL, 3000.00);
INSERT INTO empregado VALUES ('Fernando', 20202020, 22222222, 2, 10101010, 2500.00);
INSERT INTO empregado VALUES ('Ricardo', 30303030, 33333333, 2, 10101010, 2300.00);
INSERT INTO empregado VALUES ('Jorge', 40404040, 44444444, 2, 20202020, 4200.00);
INSERT INTO empregado VALUES ('Renato', 50505050, 55555555, 3, 20202020, 1300.00);

-- Inserção de instâncias de departamento 
INSERT INTO departamento VALUES ('Contabilidade', 1, 10101010);
INSERT INTO departamento VALUES ('Engenharia Civil', 2, 30303030);
INSERT INTO departamento VALUES ('Engenharia Mecânica', 3, 20202020);

-- Inserção de instâncias de projeto 
INSERT INTO projeto VALUES ('Financeiro 1', 5, 'São Paulo');
INSERT INTO projeto VALUES ('Motor 3', 10, 'Rio Claro');
INSERT INTO projeto VALUES ('Prédio Central', 20, 'Campinas');

-- Inserção de instâncias de dependentes 
INSERT INTO dependentes VALUES (10101010, 'Jorge', TO_DATE('27/12/1986', 'DD/MM/YYYY'), 'Filho', 'Masculino');
INSERT INTO dependentes VALUES (10101010, 'Luiz', TO_DATE('18/11/1979', 'DD/MM/YYYY'), 'Filho', 'Masculino');
INSERT INTO dependentes VALUES (20202020, 'Fernanda', TO_DATE('14/02/1969', 'DD/MM/YYYY'), 'Cônjuge', 'Feminino');
INSERT INTO dependentes VALUES (20202020, 'Angelo', TO_DATE('10/02/1995', 'DD/MM/YYYY'), 'Filho', 'Masculino');
INSERT INTO dependentes VALUES (30303030, 'Adreia', TO_DATE('01/05/1990', 'DD/MM/YYYY'), 'Filho', 'Feminino');

-- Inserção de instâncias de departamento_projeto 
INSERT INTO departamento_projeto VALUES (2, 5);
INSERT INTO departamento_projeto VALUES (2, 10);
INSERT INTO departamento_projeto VALUES (2, 20);

-- Inserção de instâncias de empregado_projeto 
INSERT INTO empregado_projeto VALUES (20202020, 5, 10);
INSERT INTO empregado_projeto VALUES (20202020, 10, 25);
INSERT INTO empregado_projeto VALUES (30303030, 5, 35);
INSERT INTO empregado_projeto VALUES (40404040, 20, 20);
INSERT INTO empregado_projeto VALUES (50505050, 20, 25);

-- Adicionando a chave estrangeira na tabela empregado para empregado (Supervisor)
ALTER TABLE empregado
ADD CONSTRAINT fk_empregado_departamento FOREIGN KEY (depto)
REFERENCES departamento(numero);

-- Adicionando a chave estrangeira na tabela empregado para empregado (Supervisor)
ALTER TABLE empregado
ADD CONSTRAINT fk_empregado_supervisor FOREIGN KEY (rg_supervisor)
REFERENCES EMPREGADO(rg);

-- Adicionando a chave estrangeira na tabela dependentes para empregado
ALTER TABLE dependentes
ADD CONSTRAINT fk_dependenetes_responsavel FOREIGN KEY (rg_responsavel)
REFERENCES empregado(rg);

-- Adicionando a chave estrangeira na tabela departamento para empregado (Gerente)
ALTER TABLE departamento
ADD CONSTRAINT fk_departamento_gerente FOREIGN KEY (rg_gerente)
REFERENCES empregado(rg);

-- Adicionando a chave estrangeira na tabela departamento_projeto para departamento
ALTER TABLE departamento_projeto
ADD CONSTRAINT fk_departamento_projeto_departamento FOREIGN KEY (numero_depto)
REFERENCES departamento(numero);

-- Adicionando a chave estrangeira na tabela departamento_projeto para projeto
ALTER TABLE departamento_projeto
ADD CONSTRAINT fk_departamento_projeto_projeto FOREIGN KEY (numero_projeto)
REFERENCES projeto(numero);

-- Adicionando a chave estrangeira na tabela empregado_projeto para empregado
ALTER TABLE empregado_projeto
ADD CONSTRAINT fk_empregado_projeto_empregado FOREIGN KEY (rg_empregado)
REFERENCES empregado(rg);

-- Adicionando a chave estrangeira na tabela empregado_projeto para projeto
ALTER TABLE empregado_projeto
ADD CONSTRAINT fk_empregado_projeto_projeto FOREIGN KEY (numero_projeto)
REFERENCES projeto(numero);



