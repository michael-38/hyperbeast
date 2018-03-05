require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid' do
      @category = Category.new(name: 'Footwear')
      @product = Product.new(name: 'Nike AF 1', price: 120, quantity: 38, category: @category)
      expect(@product).to be_valid
    end
    it 'is not valid without a product name ' do
      @category = Category.new(name: 'Footwear')
      @product = Product.new(name: nil)
      expect(@product).to_not be_valid
    end
    it 'is not valid without a product price ' do
      @category = Category.new(name: 'Footwear')
      @product = Product.new(price: nil)
      expect(@product).to_not be_valid
    end
    it 'is not valid without a product quantity ' do
      @category = Category.new(name: 'Footwear')
      @product = Product.new(quantity: nil)
      expect(@product).to_not be_valid
    end
    it 'is not valid without a product category ' do
      @category = Category.new(name: 'Footwear')
      @product = Product.new(category: nil)
      expect(@product).to_not be_valid
    end
  end
end




#   create_table "categories", force: :cascade do |t|
#     t.string   "name"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end


  # create_table "products", force: :cascade do |t|
  #   t.string   "name"
  #   t.text     "description"
  #   t.string   "image"
  #   t.integer  "price_cents"
  #   t.integer  "quantity"
  #   t.datetime "created_at",  null: false
  #   t.datetime "updated_at",  null: false
  #   t.integer  "category_id"
  # end