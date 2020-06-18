require 'rails_helper'

RSpec.describe "ProductsControllers", type: :request do

  describe "get products_path" do
    it "renders the index view" do
      FactoryBot.create_list(:product, 10)
      get products_path
      expect(response.status).to eq(200)
    end
  end
  describe "get product_path" do
    it "renders the :show template" do
      product = FactoryBot.create(:product)
      get product_path(id: product.id)
      expect(response.status).to eq(200)
    end
    it "redirects to the index path if the product id is invalid" do
      get product_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to products_path
    end
  end

  describe "get new_product_path" do  
   it "renders the :new template" do 
     get new_product_path  
     expect(response.status).to eq(200)
   end
  end
  describe "post products_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
     product_attributes = FactoryBot.attributes_for(:product)
      expect { post products_path, params: { product: product_attributes }
    }.to change(Product, :count)
      expect(response).to redirect_to product_path(id: Product.last.id)
    end
  end
  describe "post products_path with invalid data" do
    it "does not save a new entry or redirect" do
      product_attributes = FactoryBot.attributes_for(:product)
      product_attributes.delete(:title)
      expect { post products_path, params: { product: product_attributes }
    }.to_not change(Product, :count)
      expect(response.status).to eq(200)
    end
  end

  describe "get edit_product_path" do
    it "renders the :edit template" do
     product = FactoryBot.create(:product)
     get edit_product_path(id: product.id)
     expect(response.status).to eq(200)
    end
  end

  describe "delete a product record" do
    it "deletes a product record" do
      product = FactoryBot.create(:product)
      expect { delete product_path(product.id) }.to change {Product.count}.by(-1)
      expect(response.status).to eq(302)
    end
  end
end