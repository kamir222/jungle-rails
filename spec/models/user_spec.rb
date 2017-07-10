require 'rails_helper'

RSpec.describe User, type: :model do

  before(:example) do
    @user = User.new({
      first_name: 'Linda',
      last_name:  'the plant',
      email: 'linda_theplant@hotmail.com',
      password: "I'm a plant",
      password_confirmation: "I'm a plant"
    })
  end

  describe 'Validations' do

    it 'should create a user' do
      @user.save
      expect(@user.valid?).to be true
    end

    it 'passwords don\'t match' do
      @user
      @user.password_confirmation = ''
      @user.save

      expect(@user.valid?).to be false
    end

    it 'two users have the same email' do
      user1 = User.new({
        first_name: 'Linda',
        last_name:  'the plant',
        email: 'linda_theplant@hotmail.com',
        password: "I'm a plant",
        password_confirmation: "I'm a plant"
      })

      user1.save

      user2 = User.new({
        first_name: 'Maggy',
        last_name:  'the plant',
        email: 'linda_Theplant@hotmail.com',
        password: "I'm a plant",
        password_confirmation: "I'm a plant"
      })

      user2.save

      expect(user2.valid?).to be false
    end

    it "password is less than 8 characters long" do
      @user
      @user.password = "123"
      @user.password_confirmation = "123"
      @user.save

      expect(@user.valid?).to be false
    end

  end

  describe '.authenticate_with_credentials' do

    it 'authenticates valid users' do
      user = @user
      user.save

      expect(User.authenticate_with_credentials(user.email, user.password)).to eq(user)
    end

    it 'authenticats if user types in a few spaces before and/or after their email address' do
      user = @user
      user.save

      expect(User.authenticate_with_credentials('  linda_theplant@hotmail.com  ', user.password)).to eq(user)
    end

    it 'authenticates if user types in the wrong case for their email' do
      user = @user
      user.save

      expect(User.authenticate_with_credentials('LINDA_theplant@hotmail.com', user.password)).to eq(user)
    end

  end
end
