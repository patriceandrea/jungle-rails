require 'rails_helper'
RSpec.describe User, type: :model do
  subject {
    described_class.new(first_name: 'John', last_name: 'Tran', email: 'john@home.xyz', password: '123', password_confirmation: '123')
  }
  describe 'Validations' do
    it 'First name is required' do
      user = User.new
      user.first_name= ""
      user.last_name= "Tran"
      user.email = "julia@hotmail.com"
      user.password= "123"
      user.password_confirmation= "123"
      user.validate
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it 'Last name is required' do
      user = User.new
      user.first_name='Julia'
      user.last_name= ""
      user.email = "julia@hotmail.com"
      user.password= "123"
      user.password_confirmation= "123"
      user.validate
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    it 'Email is required' do
      user = User.new
      user.first_name='Julia'
      user.last_name= "Tram"
      user.email = ""
      user.password= "123"
      user.password_confirmation= "123"
      user.validate
      expect(user.errors[:email]).to include("can't be blank")
    end
    it 'Password is required' do
      user = User.new
      user.first_name='Julia'
      user.last_name= "Tram"
      user.email = "julia.tran@hotmail.com"
      user.password= ""
      user.password_confirmation= "123"
      user.validate
      expect(user.errors[:password]).to include("can't be blank")
    end
  it 'Password and Password confirmation match' do
   user = User.new
   user.first_name='Julia'
   user.last_name= "Tram"
   user.email = "julia.tran@hotmail.com"
   user.password= "123"
   user.password_confirmation= "123"
   user.validate
   expect(user[:password]).to eq(user[:password_confirmation])
  end
    it 'Password amd Password Confirmation do not match' do
      user = User.new
      user.first_name='Julia'
      user.last_name= "Tram"
      user.email = "julia.tran@hotmail.com"
      user.password_digest= "456"
      user.password_confirmation= "789"
      user.validate
      expect(user[:password_digest]).to_not eq(user[:password_confirmation])
    end
    it 'Password must be longer than 3 characters' do
    user = User.new
    user.first_name='Julia'
    user.last_name= "Tran"
    user.email = "julia.tran@hotmail.com"
    user.password= "12"
    user.password_confirmation= "12"
    user.validate
    expect(user.errors[:password]).to include("is too short (minimum is 3 characters)")
  end
  it 'Password is longer than 3 characters' do
    user = User.new
    user.first_name='Julia'
    user.last_name= "Tran"
    user.email = "julia.tran@hotmail.com"
    user.password= "1234"
    user.password_confirmation= "124"
    user.validate
    expect(user.errors[:password]).to_not include("is too short (minimum is 3 characters)")
  end
  it 'email must be unique' do
    user = User.new
    user.first_name = 'first_name'
    user.last_name = 'last_name'
    user.email = 'test@test.com'
    user.password = 'password'
    user.password_confirmation = 'password'
    user.save
    u = User.new
    u.first_name = 'first_name'
    u.last_name = 'last_name'
    u.email = 'test@test.com'
    u.password = 'password'
    u.password_confirmation = 'password'
    u.save
    expect(u.errors[:email].first).to eq('has already been taken')
  end
  context 'Email needs to not unique' do
    before { described_class.create!(first_name: 'John', last_name: 'Tran', email: 'john@home.xyz', password: '123', password_confirmation: '123')}
    it {expect(subject).to be_invalid}
  end
  context 'when email is  unique' do
    before { described_class.create!(first_name: 'John', last_name: 'Tran', email: 'john@hotmail.com', password: '123', password_confirmation: '123') }
    it {expect(subject).to be_valid}
  end
  end
end
describe '.authenticate_with_credentials' do
  it 'should pass with valid credentials' do
    user = User.new(
      first_name: 'first_name',
      last_name: 'last_name',
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
    user.save
    user = User.authenticate_with_credentials('test@test.com', 'password')
    expect(user).not_to be(nil)
  end
it 'should not pass with invalid credentials' do
  user = User.new(
    first_name: 'first_name',
    last_name: 'last_name',
    email: 'test@test.com',
    password: 'password',
    password_confirmation: 'password'
  )
  user.save
  user = User.authenticate_with_credentials('test@test.com', 'pass')
  expect(user).to be(nil)
end
it 'should pass even with spaces present in email' do
  user = User.new(
    first_name: 'first_name',
    last_name: 'last_name',
    email: 'test@test.com',
    password: 'password',
    password_confirmation: 'password'
  )
  user.save
  user = User.authenticate_with_credentials('  test@test.com  ', 'password')
  expect(user).not_to be(nil)
end
it 'should pass even with caps present in email' do
  user = User.new(
    first_name: 'first_name',
    last_name: 'last_name',
    email: 'test@test.com',
    password: 'password',
    password_confirmation: 'password'
  )
  user.save
  user = User.authenticate_with_credentials('tesT@tEst.com', 'password')
  expect(user).not_to be(nil)
end
end