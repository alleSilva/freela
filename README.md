<h1 align="center">
    <a href="https://freela-web.herokuapp.com/" target="_blank" rel="noopener noreferrer">🔗 Freela</a>
</h1>
<p align="center"> Uma plataforma Web que reúne pessoas com projetos, interessadas em contratar profissionais de tecnologia.</p>

## 🚀 Começando

Essas instruções permitirão que você obtenha uma cópia do projeto em operação na sua máquina local para fins de desenvolvimento e teste.

### 📋 Pré-requisitos

Para executar a versão de desenvolvimento é preciso:

```
Ruby 2.6+
Rails 6.1+
Git
NodeJs
Yarn
```
### 🔧 Instalação

- Clonar o repositório
- Acessar a pasta freela pelo terminal
```
cd freela
```
- Executar:
```
bundle config set --local without production
bundle install
```
- Em seguida executar:
```
rails webpacker:install
```
- Pressionar a tecla n para manter o arquivo de config do tailwind css, e tecle Enter

- Em seguida executar:
```
rails db:migrate
rails db:seed
rails server
```
Acesse a aplicação pelo navegador: digitando http://localhost:3000/ na barra de endereço.

Existem dois usuários já cadastrados:

```
Login do project owner: ale@email.com
Senha do project owner: 123456

Login do freelancer: freelancer@email.com
Senha do freelancer: 123456
```
Mas é possível criar outros usuários

## ⚙️ Executando os testes

Para executar os testes execute no terminal:
```
rspec --format=documentation
```
## 📦 Desenvolvimento

O sistema foi desenvolvido usando TDD(Test-driven development), com testes unitários e de integração, utilzando as gems rspec e capybara.
Esse é o projeto final da etapa 1 da turma 7 do programa [Treinadev](https://treinadev.com.br/) da [Campuscode](https://campuscode.com.br/).

## 🔗 Versão de produção
A aplicação está hospedada no heroku em: https://freela-web.herokuapp.com/

## Features

- [x] Página inicial
- [x] Cadastro de usuário
- [x] Cadastro de Profissionais
- [x] Preenchimento de perfil do Profisional
- [x] Redirecionar para preenchimento de perfil se não estiver completo 
- [x] Cadastro de projetos pelo usuário
- [x] Usuário ver seus projetos
- [x] Usuaŕio ver propostas
- [x] Aceitar/Recusar proposta
- [ ] Marcar profissional como destaque
- [ ] Encerrar inscrições para um projeto
- [x] Freelancer ver projetos disponíveis
- [x] Buscar um projeto
- [x] Freelancer faz uma proposta para um projeto
- [ ] Cancelar proposta
- [ ] Vizualizar time do projeto
- [ ] Dar feedback para projeto

## 🛠️ Construído com

* [Ruby on Rails](https://rubyonrails.org/) - O framework web usado
* [Bundle](https://bundler.io/) - Gerenciador de dependências (gems)
* [Yarn](https://yarnpkg.com/) - Gerenciador de dependências do front-end 
* [Tailwind CSS](https://tailwindcss.com/) - Framework CSS

## ✒️ Autor
Alesandro Silva, silva_alesandro@outlook.com
