module Api::V1
  class Package < ActiveRecord::Base
    has_many :courses, -> { where(visible: true).order(position: :asc) }
    has_many :qbank_questions

    private

    def self.update_position_create(position, exam_level, name)
      name = "Sketchy#{name}"
      if position_exist(position, exam_level) && !Package.exists?(name: name)
        Package.where('exam_level = ? AND position >= ?', exam_level, position).each do |item|
          item.update(position: item.position + 1) unless item.position.nil?
        end
      end
    end

    def self.update_position_update(position, exam_level, id)
      target = Package.find(id)
      position = target.position if position.nil?
      exam_level = target.exam_level if exam_level.nil?
      if position_exist(position, exam_level) && position != target.position
        Package.where('exam_level = ? AND position >= ?', exam_level, position).each do |item|
          item.update(position: item.position + 1) unless item.position.nil?
        end
      end
    end

    def self.position_exist(position, e_lvl)
      Package.where("exam_level = ?", e_lvl).each do |item|
        return true if position == item.position
      end
      false
    end

    def self.params_check_create(name, visible, position, exam_level)
      if (name.nil? || name == '') || (exam_level == '' || exam_level.nil? ||
          (exam_level != 'step-1' && exam_level != 'step-2')) ||
          (visible != false && visible != true) ||
          (!position.nil? && (!position.is_a?Integer) || position <= 0)
        true
      end
    end

    def self.params_check_update(exam_level, visible, position)
      if (!exam_level.nil? && exam_level != 'step-1' && exam_level != 'step-2') ||
          (!visible.nil? && visible != false && visible != true) ||
          (!position.nil? && ((!position.is_a?Integer) || position <= 0))
        true
      end
    end

    def self.create_my(name, exam_level, description, visible, position)
      create(slug: name.downcase,
                     name: "Sketchy#{name}",
                     description: description,
                     visible: visible,
                     position: position,
                     exam_level: exam_level)
    end

    def self.update_my(name, exam_level, description, visible, position, id)
      target = Package.find(id)
      target.update(name: "Sketchy#{name}") if name.present?
      target.update(exam_level: exam_level) if exam_level.present?
      target.update(description: description) if description.present?
      target.update(visible: visible) if visible.present?
      target.update(position: position) if position.present?
      target.update(id: id)
    end
  end
end