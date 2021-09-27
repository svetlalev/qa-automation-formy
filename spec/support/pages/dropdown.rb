module Pages
  class Dropdown
    include Capybara::DSL

    def initialize
      @dropdown_css = 'div.dropdown-menu'
    end

    def click_dropdown_button
      click_on('Dropdown button')
    end

    def select_option_from_dropdown_list(desired_option)
      within(@dropdown_css) do
        click_on(desired_option)
      end
    end

    def has_visible_dropdown_menu?
      page.has_css?(@dropdown_css)
    end
  end
end
