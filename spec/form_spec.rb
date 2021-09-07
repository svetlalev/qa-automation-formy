include NavigationHelper

describe 'Complete form', type: :feature do
  let(:first_name) { Faker::Name.first_name }
  let(:last_name) { Faker::Name.last_name }
  let(:job_title) { Faker::Job.title }
  let(:education_level) { 'College' }
  let(:gender) { 'Male' }
  let(:experience_level) { '2-4' }

  before { @form_page = go_to_form_page }

  context 'Education level' do
    before { @form_page.select_education_level(education_level) }

    example 'Select only one education level' do
      expect(@form_page).to have_checked_education(education_level)
    end

    #this test will fail as Radio buttons don't work as expected!
    example 'Select two education levels and fist one gets unchecked' do
      changed_education_level = 'High School'
      @form_page.select_education_level(changed_education_level)

      expect(@form_page).to have_checked_education(changed_education_level)
      expect(@form_page).not_to have_checked_education(education_level)
    end
  end

  context 'Gender' do
    before { @form_page.select_gender(gender) }

    example 'Select only one gender option' do
      expect(@form_page).to have_selected_gender(gender)
    end

    example 'Select multiple gender options' do
      additional_gender = 'Prefer not to say'
      @form_page.select_gender(additional_gender)

      expect(@form_page).to have_selected_gender(gender)
      expect(@form_page).to have_selected_gender(additional_gender)
    end
  end

  context 'Years of experience' do
    example 'Fill in years of experience' do
      @form_page.select_experience_level(experience_level)

      expect(@form_page).to have_selected_experience_level(experience_level)
    end
  end

  context 'Submit' do
      example 'Form' do
        @form_page.fill_in_names_with(first_name, last_name)
        @form_page.fill_in_job_title_with(job_title)
        @form_page.select_education_level(education_level)
        @form_page.select_gender(gender)
        @form_page.select_experience_level(experience_level)
        @form_page.select_todays_date
        submitted_page = @form_page.submit_form

        expect(submitted_page).to have_thank_you_message
        expect(submitted_page).to have_success_message('The form was successfully submitted!')
      end
  end
end
