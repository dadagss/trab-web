from flask import Flask, render_template, request, redirect, url_for
import sqlite3

app = Flask(__name__)

# Função para conectar e criar o banco de dados
def init_sqlite_db():
    conn = sqlite3.connect('users.db')
    print("Banco de dados criado e conectado com sucesso!")
    conn.execute('CREATE TABLE IF NOT EXISTS users (username TEXT, password TEXT)')
    print("Tabela criada com sucesso!")
    conn.close()

# Inicializa o banco de dados
init_sqlite_db()

# Rota para exibir o formulário de cadastro
@app.route('/')
def cadastro():
    return render_template('cadastro.html')

# Rota para processar o cadastro
@app.route('/submit-cadastro', methods=['POST'])
def submit_cadastro():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        # Salva os dados no banco
        with sqlite3.connect('users.db') as conn:
            cursor = conn.cursor()
            cursor.execute("INSERT INTO users (username, password) VALUES (?, ?)", (username, password))
            conn.commit()
            print("Cadastro feito com sucesso!")
        
        return redirect(url_for('cadastro'))

if __name__ == '__main__':
    app.run(debug=True)
