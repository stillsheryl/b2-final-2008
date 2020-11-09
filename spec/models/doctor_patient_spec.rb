require 'rails_helper'

RSpec.describe Patient do
  describe 'Relationships' do
    it should{belong_to :doctors}
    it should{belong_to :patients}
  end
end
