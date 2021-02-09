require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # User has matching password and password_confirmation fields
    it "has matching password and password_confirmation fields" do
      @user = User.new({name: 'Egenaz Turemis', email: 'egenazturemis@gmail.com', password: 'lhl', password_confirmation: 'lhl'})
      @user.save
      expect(@user.password).to eq @user.password_confirmation
    end

    # returns an error message when password and password_confirmation fields do not match
    it "returns an error message when password and password_confirmation fields do not match" do
      @user = User.new({name: 'Egenaz Turemis', email: 'egenazturemis@gmail.com', password: 'lhl', password_confirmation: 'lohl'})
      @user.save
      expect(@user.errors.messages[:password_confirmation]).to eq ["doesn't match Password"]
    end

    # password and password_confirmation fields are required when creating the model
    it "doesn't create a user without password or password_confirmation" do
      @user = User.new({name: 'Egenaz Turemis', email: 'egenazturemis@gmail.com', password: '', password_confirmation: ''})
      @user.save
      expect(@user.errors.messages[:password_confirmation]).to eq ["can't be blank"]
    end

    # Emails are unique (not case sensitive; for example, 
    # TEST@TEST.com should not be allowed if test@test.COM is in the database)
    it "has a unique email" do
      @user = User.new({name: 'Egenaz Turemis', email: 'egenazturemis@gmail.com', password: 'lhl', password_confirmation: 'lhl'})
      @user.save
      @user2 = User.new({name: 'Egenaz Turemis', email: 'EGENAZturemis@gmail.com', password: 'lhl', password_confirmation: 'lhl'})
      @user2.save
      expect(@user2.errors.messages[:email]).to eq ["has already been taken"]
    end

    # Email, first name, and last name should also be required
    it "doesn't create a user without an email" do
      @user = User.new({name: 'Egenaz Turemis', email: '', password: 'lhl', password_confirmation: 'lhl'})
      @user.save
      expect(@user.errors.messages[:email]).to eq ["can't be blank"]
    end
    it "doesn't create a user without a name" do
      @user = User.new({name: '', email: 'egenazturemis@gmail.com', password: 'lhl', password_confirmation: 'lhl'})
      @user.save
      expect(@user.errors.messages[:name]).to eq ["can't be blank"]
    end

    # The password must have a minimum length when a user account is being created.
    it "has a password longer than the minimum lenght requirement" do
      @user = User.new({name: 'Egenaz Turemis', email: 'egenazturemis@gmail.com', password: 'lh', password_confirmation: 'lh'})
      @user.save
      expect(@user.errors.messages[:password]).to eq ["is too short (minimum is 3 characters)"]
    end
  end

  describe '.authenticate_with_credentials' do
    it "authenticates the user based on email address and password" do
      @user = User.new({name: 'Egenaz Turemis', email: 'egenazturemis@gmail.com', password: 'lhl', password_confirmation: 'lhl'})
      @user.save
      expect(User.authenticate_with_credentials('egenazturemis@gmail.com', 'lhl')).to eq @user
    end

    it "authenticates the user even if the user types in spaces before/after their email" do
      @user = User.new({name: 'Egenaz Turemis', email: 'egenazturemis@gmail.com', password: 'lhl', password_confirmation: 'lhl'})
      @user.save
      expect(User.authenticate_with_credentials(' egenazturemis@gmail.com  ', 'lhl')).to eq @user
    end
    
    it "authenticates the user even if the user types in the wrong case for their email" do
      @user = User.new({name: 'Egenaz Turemis', email: 'egenazturemis@gmail.com', password: 'lhl', password_confirmation: 'lhl'})
      @user.save
      expect(User.authenticate_with_credentials('EGENAZturemis@gmail.com', 'lhl')).to eq @user
    end
  end
end