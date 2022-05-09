require 'rails_helper'

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Product, type: :model do


  describe 'Validations' do
    # validation tests/examples here

    it "validates name " do 
      record = Product.new 
      record.name = ''
      record.validate
      expect(record.errors[:name]).to include("can't be blank")
    end 
  end
end