require 'rails_helper'

RSpec.describe Patient do
  describe 'Relationships' do
    it should{have_many :doctor_patients}
    it should{have_many(:doctors).through(:doctor_patients)}
  end
end
