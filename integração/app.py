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
def 