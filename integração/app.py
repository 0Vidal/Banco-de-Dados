#Import do framework
#Import do render_template para leitura HTML
#request para capturar de dados
from flask import Flask, render_template, request
#biblioteca para criar conexão com mysql
import mysql.connector 

app = Flask(__name__)

#Cria conexão com MySQL
bd_config = {
    'host':'localhost',
    'user':'root',
    'password':'',
    'database':'cadastro1'
}

#Criação de rota para arquivo HTML principal
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/cadastrar',methods=['POST'])
def criar_cadastro():
    try:
        #Receber os dados do formulário
        cpf = request.form['cpf']
        primeiro_nome = request.form['primeiro_nome']
        sobrenome = request.form['sobrenome']
        idade = request.form['idade']
    
    
        #Criar conexão com o banco de dados
        conexao = mysql.connector.connect(**bd_config)
    
        #Levar instruções SQL do Python até o banco de dados
        curso = conexao.cursor()
    
        query = "INSERT INTO cliete1 (CPF, PRIMEIRO_NOME, SOBRENOME, IDADE) VALUES (%s,%s,%s,%s)"
        curso.execute(query,(cpf,primeiro_nome,sobrenome,idade)) 
    
        #salvar as alterações
        #fechar o cursor
        #fechar a conexão com o banco de dados.
        curso.commit()
        curso.close()
        conexao.close()

    except mysql.connector.Error as err:
        return f"Erro ao gravar o Banco: {err}"

