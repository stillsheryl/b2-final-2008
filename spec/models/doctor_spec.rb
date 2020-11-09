require 'rails_helper'

RSpec.describe Doctor do
  describe 'Relationships' do
    it should{belong_to :doctors}
  end
end
