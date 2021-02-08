require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validates :name
    it "has a name" do
      @category = Category.new({name: "Home deco"})
      @product = Product.new({name: "Vase", price: 300, quantity: 100, category: @category})
      @product.save
      expect(@product.name).to eq("Vase")
    end

    # validates :price
    it "has a price" do
      @category = Category.new({name: "Home deco"})
      @product = Product.new({name: "Vase", price: nil, quantity: 100, category: @category})
      @product.save
      expect(@product.price).to eq(300)
    end

    # validates :quantity
    it "has a quantity" do
      @category = Category.new({name: "Home deco"})
      @product = Product.new({name: "Vase", price: 300, quantity: 100, category: @category})
      @product.save
      expect(@product.quantity).to eq(100)
    end

    # validates :category
    it "has a category" do
      @category = Category.new({name: "Home deco"})
      @product = Product.new({name: "Vase", price: 300, quantity: 100, category: @category})
      @product.save
      expect(@product.category.name).to eq("Home deco")
    end

    # returns error message if a field is empty
    it "returns error message if a field is empty" do
      @category = Category.new({name: "Home deco"})
      @product = Product.new({name: "Vase", price: 300, quantity: nil, category: @category})
      @product.save
      expect(@product.errors.messages[:quantity]).to eq(["can't be blank"])
    end
  end
end
