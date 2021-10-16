describe 'Visitor log in' do
  context 'as freelancer and must to fill profile completely' do
    it 'successfully' do
      freelancer = Freelancer.create!(email: 'lele@mail.com.br', password: '123456')
      login_as freelancer, scope: :freelancer

      visit new_freelancer_profile_path

      fill_in 'Nome completo', with: 'Alesandro Silva'
      fill_in 'Nome Social', with: ''
      fill_in 'Data de Nascimento', with: '20/11/2021'
      fill_in 'Descrição', with: 'Sou profissional com ampla exeperiencia em sistemas'
      fill_in 'Formação', with: 'Sistemas de informação'
      fill_in 'Experiência', with: '5 anos em ruby on rails'
      attach_file 'Foto de Perfil', 'tmp/storage/foto.png'

      click_on 'Salvar'
      #expect(page).to have_content(freelancer.email)
      expect(page).to have_content('Boas vindas! Mantenha seu perfil sempre atualizado')
      expect(page).to have_content('Perfil')
    end
  end

end
