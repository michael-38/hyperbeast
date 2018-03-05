require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid' do
      @user = User.create!(name: 'Michael', email: 'mc@email.com', password: 'abcdef', password_confirmation: 'abcdef')
      expect(@user.valid?).to be_truthy
    end

    it 'is not valid when passwords do not match' do
      @user = User.new(name: 'Michael', email: 'mc@email.com', password: 'abcdef', password_confirmation: 'defghi')
      expect(@user.valid?).to be_falsy
    end

    it 'is not valid when passwords is less than 6 characters' do
      expect{ 
        User.create!(name: 'Michael', email: 'mc@email.com', password: '12345', password_confirmation: '12345')
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without name' do
      expect{ 
        User.create!(name: nil, email: 'mc@email.com', password: '123456', password_confirmation: '123456')
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without email' do
      expect{ 
        User.create!(name: nil, email: nil, password: '123456', password_confirmation: '123456')
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid if email already exists in database' do
      @user1 = User.create!(name: 'Michael', email: 'abc@email.com', password: 'aaaaaa', password_confirmation: 'aaaaaa')
      expect {
        User.create!(name: 'Michael2', email: 'abc@email.com', password: 'bbbbbb', password_confirmation: 'bbbbbb')
    }.to raise_error(ActiveRecord::RecordInvalid)
      # expect(User.where(email: @user2.email)).to exist
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should allow user to log in if authenticated' do
      @user = User.create!(name: 'Michael', email: 'mc@email.com', password: 'abcdef', password_confirmation: 'abcdef')
      expect(User.authenticate_with_credentials('mc@email.com', 'abcdef')).to eq(@user)
    end

    it 'should not allow user to log in if not authenticated' do
      @user = User.create!(name: 'Michael', email: 'mc@email.com', password: 'abcdef', password_confirmation: 'abcdef')
      expect(User.authenticate_with_credentials('mc@email.com', 'fedcda')).to eq(nil)
    end


    it 'should allow user to log in since email is case-insensitive' do
      @user = User.create!(name: 'Michael', email: 'mc@email.com', password: 'abcdef', password_confirmation: 'abcdef')
      expect(User.authenticate_with_credentials('MC@Email.com', 'abcdef')).to eq(@user)
    end

    it 'should allow user to log in if email has leading/trailing whitespaces' do
      @user = User.create!(name: 'Michael', email: 'mc@email.com', password: 'abcdef', password_confirmation: 'abcdef')
      expect(User.authenticate_with_credentials('  MC@Email.com  ', 'abcdef')).to eq(@user)
    end
  end
end



  # create_table "users", force: :cascade do |t|
  #   t.string   "name"
  #   t.string   "email"
  #   t.string   "password_digest"
  #   t.datetime "created_at",      null: false
  #   t.datetime "updated_at",      null: false
  # end