require 'rails_helper'

RSpec.describe "CategoriesControllers", type: :request do
  describe "get categories_path" do
      it "renders the index view" do
        FactoryBot.create_list(:category, 10)
        get categories_path
        expect(response.status).to eq(200)
      end
    end
  describe "get category_path" do
    it "renders the :show template" do
      category = FactoryBot.create(:category)
      get category_path(id: category.id)
      expect(response.status).to eq(200)
    end
    it "redirects to the index path if the user id is invalid" do
      get category_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to categories_path
    end
  end
    describe "get new_category_path" do
        it "renders the :new template" do
          get new_category_path
          expect(response.status).to eq(200)
        end
      end
    describe "get edit_category_path" do
        it "renders the :edit template" do
        category = FactoryBot.create(:category)
        get edit_category_path(id: category.id)
        expect(response.status).to eq(200)
        end
    end


    describe "post categories_path with valid data" do
        it "saves a new entry and redirects to the show path for the entry" do
          category_attributes = FactoryBot.attributes_for(:category)
          expect { post categories_path, params:{category: category_attributes}
        }.to change(Category, :count)
          expect(response).to redirect_to category_path(id: Category.last.id)
        end
    end

    describe "post categories_path with valid data" do
        it "saves a new entry and redirects to the show path for the entry" do
          category_attributes = FactoryBot.attributes_for(:category)
          expect { post categories_path, params: { category: category_attributes }
        }.to change(Category, :count)
        expect(response).to redirect_to category_path(id: Category.last.id)
        end
    end

    describe "get edit_category_path" do
        it "renders the :edit template" do
        category = FactoryBot.create(:category)
        get edit_category_path(id: category.id)
        expect(response.status).to eq(200)
        end
    end
    describe "delete a category record" do
        it "deletes a category record" do
        category = FactoryBot.create(:category)
        expect { delete category_path(category.id) }.to change {Category.count}.by(-1)
        expect(response.status).to eq(302)
        end
    end
end