describe 'Visitor log in' do
  context 'as freelancer and must to fill profile completely' do
    it 'successfully' do
      freelancer = Freelancer.create!(email: 'lele@mail.com.br', password: '123456')
      login_as freelancer, scope: :freelancer

      visit new_freelancer_profile_path

      fill_in 'Nome completo', with: 'Alesandro Silva'
      fill_in 'Nome Social', with: ''
      fill_in 'Data de Nascimento', '2021-09-04'

      #expect(page).to have_content(freelancer.email)
      expect(page).to have_content('Boas vindas! Mantenha seu perfil sempre atualizado')
      expect(page).to have_content('Perfil')
      expect(page).to have_link('Salvar')
    end
  end

end
