module Pages
  class Modal
    include Capybara::DSL

    def open_modal
      click_on('modal-button')
    end

    def click_x_button
      sleep(1)
      find('button.close span').click
      sleep(1)
    end

    def click_button_in_modal(button_text)
      sleep(1)
      click_on(button_text)
      sleep(1)
    end

    def has_visible_modal?
      page.has_css?('#exampleModal')
    end
  end
end
