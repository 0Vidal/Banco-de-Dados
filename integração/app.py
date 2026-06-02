#Import do framework
#Import do render_template para leitura HTML
#request para capturar de dados
from flask import Flask, render_template, request
#biblioteca para criar conexão com mysql
import mysql.connector 

#Cria conexão com MySQL
bd_config = {
    'host':'localhost',
    'user':'root',
    'password':'escola',
    'database':'cadastro1'
}