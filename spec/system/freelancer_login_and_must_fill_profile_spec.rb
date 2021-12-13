describe 'Visitor log in' do
  context 'as freelancer and must to fill profile completely' do
    it 'successfully' do
      freelancer = Freelancer.create!(email: 'lele@mail.com.br', password: '123456')
      _actuation_area = ActuationArea.create!(name: 'Front End')
      login_as freelancer, scope: :freelancer

      visit new_freelancer_profile_path

      fill_in 'Nome completo', with: 'Alesandro Silva'
      fill_in 'Nome Social', with: 'Ale Silva'
      fill_in 'Data de Nascimento', with: '20/11/1986'
      fill_in 'Descrição', with: 'Sou profissional com ampla exeperiencia em sistemas'
      fill_in 'Formação', with: 'Sistemas de informação'
      fill_in 'Experiência', with: '5 anos em ruby on rails'
      select 'Front End', from: 'Área de atuação'
      attach_file 'Foto de Perfil', 'app/assets/images/foto.png'

      click_on 'Salvar'
      # expect(page).to have_content(freelancer.email)
      expect(page).to have_content('Boas vindas! Mantenha seu perfil sempre atualizado')
      expect(page).to have_content('Perfil')
      expect(page).to have_content('Nome completo: Alesandro Silva')
      expect(page).to have_content('Nome Social: Ale Silva')
      expect(page).to have_content('Data de Nascimento: 20/11/1986')
      expect(page).to have_content('Descrição: Sou profissional com ampla exeperiencia em sistemas')
      expect(page).to have_content('Formação: Sistemas de informação')
      expect(page).to have_content('Experiência: 5 anos em ruby on rails')
      expect(page).to have_content('Área de atuação: Front End')
    end

    it 'and try to send empty profile' do
      freelancer = Freelancer.create!(email: 'lele@mail.com.br', password: '123456')
      _actuation_area = ActuationArea.create!(name: 'Front End')
      login_as freelancer, scope: :freelancer

      visit new_freelancer_profile_path

      click_on 'Salvar'
      # expect(page).to have_content(freelancer.email)
      expect(page).to have_content('Nome não pode ficar em branco')
      expect(page).to have_content('Nome Social não pode ficar em branco')
      expect(page).to have_content('Data de nascimento não pode ficar em branco')
      expect(page).to have_content('Formação não pode ficar em branco')
      expect(page).to have_content('Descrição não pode ficar em branco')
      expect(page).to have_content('Experiência não pode ficar em branco')
    end
  end

  context 'try to login without fill login fields' do
    it 'no success' do
      visit root_path
      click_on 'Entrar'
      click_on 'Entrar como freelancer'
      within 'form' do
        click_on 'Entrar'
      end

      expect(page).to have_content('Email ou senha inválidos.')
    end
  end

  context 'when login without filled profile previously' do
    it 'is redirected to profile form' do
      freelancer = Freelancer.create!(email: 'lele@mail.com.br', password: '123456')

      visit root_path
      click_on 'Entrar'
      click_on 'Entrar como freelancer'
      fill_in 'Email', with: freelancer.email
      fill_in 'Senha', with: freelancer.password
      within 'form' do
        click_on 'Entrar'
      end

      expect(page).to have_content('Mantenha seu perfil sempre atualizado')
    end
  end
end
