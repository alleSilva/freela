<h1 align="center">
    <a href="https://freela-web.herokuapp.com/">🔗 Freela</a>
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

rails server
```
Acesse a aplicação pelo navegador: digitando http://localhost:3000/ na barra de endereço.

## ⚙️ Executando os testes

Para executar os testes execute no terminal:
```
rspec
```
## 📦 Desenvolvimento

O sistema foi desenvolvido usando TDD(Test-driven development), com testes unitários e de integração, utilzando as gems rspec e capybara.
Esse é o projeto final da etapa 1 da turma 7 do programa [Treinadev](https://treinadev.com.br/) da [Campuscode](https://campuscode.com.br/).

## 🔗 Versão de produção
A aplicação está hospedada no heroku em: https://freela-web.herokuapp.com/

## Features

- [x] Página inicial
- [ ] Cadastro de usuário
- [ ] Cadastro de Profissionais
- [ ] Cadastro de projetos pelo usuário

## 🛠️ Construído com

* [Ruby on Rails](https://rubyonrails.org/) - O framework web usado
* [Bundle](https://bundler.io/) - Gerenciador de dependências (gems)
* [Yarn](https://yarnpkg.com/) - Gerenciador de dependências do front-end 
* [Tailwind CSS](https://tailwindcss.com/) - Framework CSS

## ✒️ Autor
Alesandro Silva, silva_alesandro@outlook.com
