module Components
  class NavBar
    include Capybara::DSL

    def go_to_component_page(page_name)
      click_on('Components')
      within('.dropdown-menu') do
        click_on(page_name)
      end
    end
  end
end
