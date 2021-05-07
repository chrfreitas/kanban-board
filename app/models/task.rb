class Task < ApplicationRecord
  after_save :save_log
  after_destroy :destroy_log

  validates :name, :description, presence: true
 
  def save_log
    puts "Taks saved!"
  end

  def destroy_log
    puts "Taks deleted!"
  end
end
