require 'test_helper'

class NotesIntegrationTest < ActionDispatch::IntegrationTest

  test 'Creating a note saves it' do
    login users(:dave)
    click_button 'New Note'
    fill_in 'note[title]', with: 'Awesome note'
    fill_in_richtext page, 'Lorem ipsum'
    click_button 'Create Note'
    assert page.has_content? 'Your note has been created'
    assert page.has_content? 'Lorem ipsum'
  end

  test 'Updating a note changes it' do
    login users(:dave)
    choose_note notes(:groceries)
    fill_in 'note[title]', with: 'Food'
    fill_in_richtext page, '<ul><li>Baloney</li></ul>'
    click_button 'Update Note'
  end

  test 'Deleting a note removes it' do
    login users(:dave)
    choose_note notes(:todo)
    within('form.edit_note') do
      page.accept_confirm do
        find('i.fa-trash-o').click
      end
    end
    assert page.has_content? 'note has been deleted'
  end

end