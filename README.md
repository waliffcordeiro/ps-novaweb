## API para o Processo Seletivo da Nova Web

A opção escolhida foi:
- Implementar a solução na linguagem de sua preferência, incluindo ao menos uma carga de trabalho do github actions que publica uma imagem docker no github packages do seu repositório e um arquivo de deploy para um cluster kubernetes.

____
### Especificações do projeto
Linguagem escolhida: **Ruby**
Framework: **Ruby on Rails**

rails new ContactNovaWeb --api --database=postgresql -T

Principais Gems:
- **Rack Attack**: Evitar ataques à API.
- **Rack Cors**: Permitir que outros sites chamem a API via Ajax.
- **RSpec** e **FactoryBot**: Testes automatizados das models criadas.
____    
### Para rodar os testes

**rspec spec**

Foram realizados testes automatizados de:
- Model
- Rotas
- Requests
____  
### Heroku
Foi feito o deploy da aplicação utilizando o heroku e pode ser acessado pela URL [https://novaweb-api.herokuapp.com](https://novaweb-api.herokuapp.com/api/v1/contacts.json).
Vale ressaltar que o deploy foi feito em um plano gratuito, portanto, em um primeiro acesso, a resposta irá demorar em torno de 10 segundos (tempo para o servidor sair do modo hibernação).

____