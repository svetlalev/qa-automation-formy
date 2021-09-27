module Pages
  class Form
    include Capybara::DSL

    def initialize
      @years_of_experience_select = 'select-menu'
      @input_group_css = 'div.input-group'
    end

    def fill_in_names_with(names = {})
      if names.key?(:first_name)
        fill_in('first-name', with: names[:first_name])
      else
        fill_in('first-name', with: Faker::Name.first_name)
      end

      if names.key?(:last_name)
        fill_in('last-name', with: names[:last_name])
      else
        fill_in('last-name', with: Faker::Name.last_name)
      end
    end

    def fill_in_job_title_with(job_title = 'QA')
      fill_in('job-title', with: job_title)
    end

    def select_education_level(selected_level)
      within_education_radio_buttons do
        find('div', text: selected_level).choose
      end
    end

    def select_gender(sex)
      within_gender_selection do
        radio_or_checkbox_field(sex).set(true)
      end
    end

    def select_experience_level(experience_level)
      select(experience_level, from: @years_of_experience_select)
    end

    def select_todays_date
      find('#datepicker').click
      find('td.today.day').click
    end

    def fill_in_form_with(options = {})
      fill_in_names_with(first_name: options[:first_name], last_name: options[:last_name])
      fill_in_job_title_with(options[:job_title]) if options.key?(:job_title)
      select_education_level(options[:education_level]) if options.key?(:education_level)
      select_gender(options[:sex]) if options.key?(:sex)
      select_experience_level(options[:experience_level]) if options.key?(:experience_level)
      select_todays_date
    end

    def submit_form
      click_on('Submit')
      Pages::Success.new
    end

    def has_checked_education?(selected_education_level)
      within_education_radio_buttons do
        radio_or_checkbox_field(selected_education_level).selected?
      end
    end

    def has_selected_gender?(selected_gender)
      within_gender_selection do
        radio_or_checkbox_field(selected_gender).selected?
      end
    end

    def has_selected_experience_level?(experience_level)
      page.has_select?(@years_of_experience_select, selected: experience_level)
    end

    private

    def within_education_radio_buttons(&block)
      within(find(@input_group_css, text: 'Highest level of education'), &block)
    end

    def within_gender_selection(&block)
      within(find(@input_group_css, text: 'Sex'), &block)
    end

    def radio_or_checkbox_field(selected_option)
      find(:xpath, "//div[text()[contains(.,'#{selected_option}')]]/input")
    end
  end
end
