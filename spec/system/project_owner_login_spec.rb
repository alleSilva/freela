describe 'Visitor log in' do
  context 'as project owner' do
    it 'successfully' do
      project_owner = ProjectOwner.create!(email: 'ale@mail.com.br', password: '123456')

      visit root_path
      click_on 'Entrar'
      click_on 'Entrar e publicar um projeto'
      fill_in 'Email', with: project_owner.email
      fill_in 'Password', with: project_owner.password
      within 'form' do
        click_on 'Log in'
      end

      expect(page).to have_content('Logado com sucesso')
      # expect(page).to have_content(project_owner.email)
      expect(page).to have_link('Logout')
      expect(page).not_to have_link('Entrar')
      expect(page).to have_link('Publicar projeto')
    end
  end

  context 'as freelancer' do
    it 'successfully' do
      freelancer = Freelancer.create!(email: 'alesandro@mail.com.br', password: '123456')

      visit root_path
      click_on 'Entrar'
      click_on 'Entrar como freelancer'
      fill_in 'Email', with: freelancer.email
      fill_in 'Password', with: freelancer.password
      within 'form' do
        click_on 'Log in'
      end

      expect(page).to have_content('Logado com sucesso')
      #expect(page).to have_content(freelancer.email)
      expect(page).to have_link('Logout')
      expect(page).not_to have_link('Entrar')
      expect(page).not_to have_link('Publicar projeto')
    end
  end

end
