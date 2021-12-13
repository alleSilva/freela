freelancer = Freelancer.create(email: 'freelancer@email.com', password: '123456')
owner = ProjectOwner.create(email: 'owner@email.com', password: '123456')
ale = ProjectOwner.create(email: 'ale@email.com', password: '123456')
iza = ProjectOwner.create(email: 'iza@email.com', password: '123456')

actuation_area1 = ActuationArea.create(name: 'Front End')
actuation_area2 = ActuationArea.create(name: 'Back End')
actuation_area3 = ActuationArea.create(name: 'Full Stack')
actuation_area4 = ActuationArea.create(name: 'UI/UX')
actuation_area5 = ActuationArea.create(name: 'DBA')
actuation_area6 = ActuationArea.create(name: 'Ciência de dados')

# FreelancerProfile.create!({
#   name: 'Jonh Snow',
#   social_name: 'Snow',
#   birth_date: '01/01/1980',
#   education: 'Cursou Análise e Desenvolvimento de Sistemas',
#   description: 'Busco sempre entregar um produto com qualidade e que gere valor para o cliente',
#   experience: '5 anos em desenvolvimento fullstack',
#   image: photo,
#   actuation_area_id: actuation_area3.id,
#   freelancer_id: freelancer.id
# })

ale_project = Project.create({
                               title: 'Landing Page',
                               description: 'Landing page para promoção e venda de produtos de beleza',
                               skills: 'html, css, javascript',
                               max_payment_hour: 90,
                               remote: true,
                               limit_bid_date: '01/12/2021',
                               project_owner: ale
                             })

iza_project = Project.create({
                               title: 'Ruby on rails api',
                               description: 'api to serve app',
                               skills: 'Ruby, Ruby on Rails, json',
                               max_payment_hour: 100,
                               remote: true,
                               limit_bid_date: '11/12/2021',
                               project_owner: iza
                             })

iza_project2 = Project.create({
                                title: 'Loja virtual',
                                description: 'Loja virtual de roupas com vaŕias opçoes de entrega e pagamento',
                                skills: 'Wordpress, Html, CSS, PHP',
                                max_payment_hour: 120,
                                remote: true,
                                limit_bid_date: '11/12/2021',
                                project_owner: iza
                              })

proposal1 = Proposal.create({
                              payment_hour: 100,
                              week_hours: 30,
                              conclusion_date: '01/01/2022',
                              resume: 'Tenho experiência com sites e Lending pages e ótimo domínio de html e css',
                              project: ale_project,
                              project_owner: ale,
                              freelancer: freelancer
                            })

proposal2 = Proposal.create!({
                               payment_hour: 90,
                               week_hours: 35,
                               conclusion_date: '11/01/2022',
                               resume: 'Em meu portifólio ha várias entregas de lojas virtuais dos mais variados ramos',
                               project: iza_project,
                               project_owner: ale,
                               freelancer: freelancer
                             })
