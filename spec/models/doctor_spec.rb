require 'rails_helper'

RSpec.describe Doctor do
  describe 'Relationships' do
    it should{belong_to :doctors}
    it should{have_many :doctor_patients}
    it should{have_many(:patients).through(:doctor_patients)}
  end
end
