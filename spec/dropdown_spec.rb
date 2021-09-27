describe 'Dropdown Component', type: :feature do
  include NavigationHelper

  example 'Select an option and get redirected to proper page' do
    open_home_page
    @nav_bar = Components::NavBar.new
    @nav_bar.go_to_component_page('Dropdown')

    @dropdown_page = Pages::Dropdown.new
    @dropdown_page.click_dropdown_button

    expect(@dropdown_page).to have_visible_dropdown_menu

    @dropdown_page.select_option_from_dropdown_list('Drag and Drop')
    expect(page).to have_current_path('/dragdrop')
  end
end
