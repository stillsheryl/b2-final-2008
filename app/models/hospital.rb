class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def unique_universities
    self.doctors.select(:university).order(:university).pluck(:university).uniq
  end
end
