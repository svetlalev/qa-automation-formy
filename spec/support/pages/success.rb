module Pages
  class Success
    include Capybara::DSL

    def has_thank_you_message?
      page.has_content?('Thanks for submitting your form')
    end

    def has_success_message?(success_message)
      alert_message.has_content?(success_message)
    end

    private

    def alert_message
      find('div.alert')
    end
  end
end
