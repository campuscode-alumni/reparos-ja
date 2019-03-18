require 'rails_helper'

feature 'administrator remove category' do
    scenario 'successfully' do
        pending
        create(:category, name: 'Pedreiro')

        visit categories_path
        click_on 'Pedreiro'
        click_on 'Excluir Categoria'

        expect(current_path).to eq root_path
        expect(page).to have_content('Categoria excluida com sucesso')
        expect(Category.count).to eq 0
    end
end