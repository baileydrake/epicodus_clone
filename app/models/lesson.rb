class Lesson < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true
  validates :number, :uniqueness => true
  belongs_to :section


  def next
    lessons_by_number = Lesson.all.order(:number)
    current_index = lessons_by_number.find_index {|lesson| self.number == lesson.number}
    next_lesson = lessons_by_number[(current_index) + 1]
    if current_index >= ((lessons_by_number.length) - 1)
      return nil
    else
   Lesson.where(:number => next_lesson.number).first
    end
  end

  def prev
  lessons_by_number = Lesson.all.order(:number)
    current_index = lessons_by_number.find_index {|lesson| self.number == lesson.number}
    prev_lesson = lessons_by_number[(current_index) - 1]
    if current_index == 0
      return nil
    else
   Lesson.where(:number => prev_lesson.number).first
    end
  end

end
