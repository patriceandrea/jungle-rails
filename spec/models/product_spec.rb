require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'validates name' do
      record = Product.new
      record.name=''
      record.price = 5
      record.quantity = 1
      record.category_id = 1
      record.validate
      expect(record.errors[:name]).to include("can't be blank")
    end
    it 'validates price' do
      record = Product.new
      record.name='New Tree'
      record.price = 5
      record.quantity = 2
      record.category_id = 1
      record.validate
      expect(record.errors[:price]).to_not include("is not a number")
    end
    it 'validates price with a string input' do
      record = Product.new
      record.name='New Tree'
      record.price = "Hello"
      record.quantity = 2
      record.category_id = 1
      record.validate
      expect(record.errors[:price]).to include("is not a number")
    end
    it 'validates quanity cannot be blank' do
      record = Product.new
      record.name='New Tree'
      record.price = 0
      record.quantity = ""
      record.category_id = 1
      record.validate
      expect(record.errors[:quantity]).to include("can't be blank")
    end
    it 'validates category cannot be blank' do
      record = Product.new
      record.name='New Tree'
      record.price = 0
      record.quantity = 1
      record.category_id = ""
      record.validate
      expect(record.errors[:category]).to include("can't be blank")
    end
  end
end