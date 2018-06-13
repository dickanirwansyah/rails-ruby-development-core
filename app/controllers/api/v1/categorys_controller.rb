module Api
  module V1
    class CategorysController < ApplicationController

        def index
          categorys = Category.order('created_at DESC')
          render json:{status:'success', message:'categorys is loaded', data:categorys},
          status: :ok
        end

        def create
          category = Category.new(params_category)
          if category.save
            render json:{status:'success', message:'category is saved', data:category},
            status: :ok
          else
            render json:{status:'error', message:'category not saved', data:category.errors},
            status: :unprocessable_entity
          end
        end

        def destroy
          category = Category.find(params[:id])
          category.destroy
          render json:{status:'success', message:'category is destroy', data:category},
          status: :ok
        end

        def update
          category = Category.find(params[:id])
          if category.update_attributes(params_category)
            render json:{status:'success', message:'category is update', data:category},
            status: :ok
          else
            render json:{status:'error', message:'category not update', data:category.errors},
            status: :unprocessable_entity
          end
        end

        private def params_category
          params.permit(:name, :description)
        end
    end
  end
end
