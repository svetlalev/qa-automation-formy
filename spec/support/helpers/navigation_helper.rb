module NavigationHelper
  include Capybara::DSL

  def open_home_page
    visit('')
  end

  def go_to_form_page
    visit('form')
    Pages::Form.new
  end

  def has_path?(path)
    current_path.eql?(path)
  end
end
