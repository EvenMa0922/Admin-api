describe Api::V1::SectionsController do
  before do
    # package = FactoryGirl.create(:api_v1_package)
    # @section = package.courses.first.chapters.first.section.first
    @package = FactoryGirl.create(:api_v1_package)
    @course = FactoryGirl.create(:api_v1_course)
    @chapter = FactoryGirl.create(:api_v1_chapter)
    @section = FactoryGirl.create(:api_v1_section)
    @sketchy_symbol = FactoryGirl.create(:api_v1_sketchy_symbol)
    @qbank_question = FactoryGirl.create(:api_v1_qbank_question)
    @qbank_answer = FactoryGirl.create(:api_v1_qbank_answer)
  end
  describe 'show' do
    context 'For a requested section by ID, render the following attributes' do
      it 'Return attributes that are required' do
        get :show, params: {id: @section.id}

        resp = JSON.parse(response.body)
        resp_symbol = resp['symbols'].first
        resp_question = resp['questions'].first
        resp_answer = resp_question['answer_explanation'].first

        expect(resp['chapter_section_position']).to eq @chapter.position.to_s + '.' + @section.position.to_s
        expect(resp['id']).to eq @section.id
        expect(resp['name']).to eq @section.name
        expect(resp['position']).to eq @section.position
        expect(resp['slug']).to eq @section.slug
        expect(resp['package']).to eq @package.name
        expect(resp['course']).to eq @course.name
        expect(resp['chapter']).to eq @chapter.name
        expect(resp_symbol['position']).to eq @sketchy_symbol.position
        expect(resp_symbol['name']).to eq @sketchy_symbol.symbol_name
        expect(resp_symbol['description']).to eq @sketchy_symbol.hotspot_info
        expect(resp_question['question_stem']).to eq @qbank_question.question
        expect(resp_answer['answer']).to eq @qbank_answer.answer
        expect(resp_answer['explanation']).to eq @qbank_answer.explanation
      end
    end
  end
end