describe 'Modal', type: :feature do
  include NavigationHelper

  before do
    open_home_page
    @nav_bar = Components::NavBar.new
    @nav_bar.go_to_component_page('Modal')

    @modal_page = Pages::Modal.new
  end

  context 'Visibility' do
    example 'Not visible on initial page load' do
      expect(@modal_page).not_to have_visible_modal
    end

    example 'Visible after clicking Open modal' do
      @modal_page.open_modal

      expect(@modal_page).to have_visible_modal
    end
  end

  context 'Closing the modal' do
    before { @modal_page.open_modal }

    example 'Clicking X closes the modal' do
      @modal_page.click_x_button

      expect(@modal_page).not_to have_visible_modal
    end

    example 'Clicking Close closes the modal' do
      @modal_page.click_button_in_modal('Close')

      expect(@modal_page).not_to have_visible_modal
    end

    example 'Clicking OK closes the modal' do
      @modal_page.click_button_in_modal('OK')

      expect(@modal_page).not_to have_visible_modal
    end
  end
end
