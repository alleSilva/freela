describe 'Create a actuation area' do
    it 'successfully' do
      visit new_actuation_area_path

      fill_in 'Área de Atuação', with: 'Front End'

      click_on 'Salvar'

      expect(page).to have_content('Área de Atuação: Front End')
      expect(page).to have_link('Cadastrar nova área de atuação', href: new_actuation_area_path)

    end
end

