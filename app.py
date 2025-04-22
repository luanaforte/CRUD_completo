import mysql.connector 

conexao = mysql.connector.connect(
    host = 'localhost', #servidor
    user='root', #usuário
    password='', #senha
    database='clinica' #nome do banco de dados
)
cursor = conexao.cursor()

# CRUD

def inserir():
    novo_usuario = input("Digite o nome do paciente: ")
    cpf_usuario = int(input(f"Digite o CPF do paciente {novo_usuario}: "))

    #CRIANDO UM COMANDO NO BANCO DE DADOS
    comandoSQL = (f"INSERT INTO paciente (nome_paciente, cpf)" f"VALUES ('{novo_usuario}', {cpf_usuario})")

    cursor.execute(comandoSQL)
    conexao.commit()


def consultarTodosPacientes(): 
    comandoSQL = "SELECT * FROM paciente" 
    cursor.execute(comandoSQL)
    resultadoConsulta = cursor.fetchall() # exibir dados
    print(resultadoConsulta)

def atualizarNomePaciente():
    id_paciente = int(input("Digite i ID do paciente: "))
    atualizar_nome = input("Digite o novo nome do paciente")
    comandoSQL = f"UPDATE paciente SET nome_paciente = '{atualizar_nome}' WHERE id_paciente ={id_paciente}"
    cursor.execute(comandoSQL)
    conexao.commit()

def deletarPaciente():
    id_paciente = int(input("Digite o ID do paciente: "))
    comandoSQL = f"DELETE FROM paciente WHERE in_paciente = {id_paciente}"
    cursor.execute(comandoSQL)
    conexao.commit()

menu = int(input("Digite o que você irá fazer: \n"
                '1 - C - Cadastar paciente\n'
                '2 - R - Consultar todos os pacientes\n'
                '3 - U - Atualizar paciente\n'
                '4 - D - Deletar paciente\n'))
if menu == 1:
    print('\n')
    inserir()
elif menu == 2:
    print('\n')
    consultarTodosPacientes()
elif menu == 3:
    print('\n')
    atualizarNomePaciente()
elif menu == 4:
    print('\n')
    deletarPaciente()
else:
    print("Opção inválida!")