describe 'Create a actuation area' do
  it 'must be signed in' do
    # Act 
    visit new_actuation_area_path
    # Assert
    expect(page).to have_content('Faça login para ter acesso ao site')
  end

    it 'successfully' do
      project_owner = ProjectOwner.create!(email: 'owner@email.com.br', password: '123456')

      #Act
      login_as project_owner, scope: :project_owner
      visit new_actuation_area_path

      fill_in 'Área de Atuação', with: 'Front End'

      click_on 'Salvar'

      expect(page).to have_content('Área de Atuação: Front End')
      expect(page).to have_link('Cadastrar nova área de atuação', href: new_actuation_area_path)
    end

    it 'with no filled data' do
      project_owner = ProjectOwner.create!(email: 'owner@email.com.br', password: '123456')

      #Act
      login_as project_owner, scope: :project_owner
      visit new_actuation_area_path

      click_on 'Salvar'

      expect(page).to have_content('Nome não pode ficar em branco')
      expect(page).not_to have_link('Cadastrar nova área de atuação', href: new_actuation_area_path)
    end

    it 'filled with previous data saved' do
      project_owner = ProjectOwner.create!(email: 'owner@email.com.br', password: '123456')
      actuation_area = ActuationArea.create!(name: 'Front End')
      #Act
      login_as project_owner, scope: :project_owner
      visit new_actuation_area_path
      fill_in 'Área de Atuação', with: 'front end'

      click_on 'Salvar'

      click_on 'Salvar'

      expect(page).to have_content('Nome já está em uso')
      expect(page).not_to have_link('Cadastrar nova área de atuação', href: new_actuation_area_path)
    end
end

