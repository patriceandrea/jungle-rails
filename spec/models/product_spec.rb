require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'validates name' do
      product = Product.new
      product.name=''
      product.price = 5
      product.quantity = 1
      product.category_id = 1
      product.validate
      expect(product.errors[:name]).to include("can't be blank")
    end
    it 'validates price' do
      product = Product.new
      product.name='New Tree'
      product.price = 5
      product.quantity = 2
      product.category_id = 1
      product.validate
      expect(product.errors[:price]).to_not include("is not a number")
    end
    it 'validates price with a string input' do
      product = Product.new
      product.name='New Tree'
      product.price = "Hello"
      product.quantity = 2
      product.category_id = 1
      product.validate
      expect(product.errors[:price]).to include("is not a number")
    end
    it 'validates quanity cannot be blank' do
      product = Product.new
      product.name='New Tree'
      product.price = 0
      product.quantity = ""
      product.category_id = 1
      product.validate
      expect(product.errors[:quantity]).to include("can't be blank")
    end
    it 'validates category cannot be blank' do
      product = Product.new
      product.name='New Tree'
      product.price = 0
      product.quantity = 1
      product.category_id = ""
      product.validate
      expect(product.errors[:category]).to include("can't be blank")
    end
  end
end