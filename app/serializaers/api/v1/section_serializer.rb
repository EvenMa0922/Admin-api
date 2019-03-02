module Api::V1
  class SectionSerializer < ActiveModel::Serializer
    attributes :chapter_section_position, :id, :name, :position, :slug,
               :package, :course, :chapter, :symbols, :questions

    def chapter_section_position
      object.chapter.position.to_s + '.' + object.position.to_s
    end

    def package
      object.chapter.course.package.name
    end

    def course
      object.chapter.course.name
    end

    def chapter
      object.chapter.name
    end

    def symbols
      sym = Api::V1::SketchySymbol.where(section_id: object.id)
      sym.map do |item|
        {position: item.position,
        name: item.symbol_name,
        description: item.hotspot_info}
      end
    end

    def questions
      ques = Api::V1::QbankQuestion.where(section_id: object.id)
      ques.map do |item|
        {question_stem: item.question,
        answer_explanation: answer_explanation(item.id)}
      end
    end

    def answer_explanation(ques_id)
      ans = Api::V1::QbankAnswer.where(qbank_question_id: ques_id)
      ans.map do |item|
        {answer: item.answer,
         # correct: item.correct,
        explanation: item.explanation}
      end
    end
  end
end