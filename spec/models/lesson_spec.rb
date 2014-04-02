require 'spec_helper'

describe Lesson do
  it{ should validate_presence_of :name }
  it{ should validate_presence_of :description }

  context '#next' do
    it 'returns the lesson with the next-highest number than the current lesson' do
      current_lesson = Lesson.create({:name => 'lesson1', :description => 'this i', :number => 1})
      next_lesson = Lesson.create({:name => 'lesson2', :description => 'this i', :number => 2})
      current_lesson.next.should eq next_lesson
    end
  end

  context '#prev' do
    it 'returns the lesson with the next-lowest number than the current lesson' do
      current_lesson = Lesson.create({:name => 'lesson1', :description => 'this i', :number => 1})
      next_lesson = Lesson.create({:name => 'lesson2', :description => 'this i', :number => 2})
      next_lesson.prev.should eq current_lesson
    end
  end

  context '#next' do
    it 'returns the lesson with the next-highest number than the current lesson' do
      current_lesson = Lesson.create({:name => 'lesson1', :description => 'this i', :number => 1})
      next_lesson = Lesson.create({:name => 'lesson2', :description => 'this i', :number => 3})
      current_lesson.next.should eq next_lesson
    end
  end

end
