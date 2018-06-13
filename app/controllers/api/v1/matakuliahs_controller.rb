module Api
  module V1
    class MatakuliahsController < ApplicationController
      def index
        matakuliahs = Matakuliah.order('created_at DESC')
        render json:{status:'success', message:'matakuliahs is loaded', data:matakuliahs},
        status: :ok
      end

      def create
        matakuliah = Matakuliah.new(params_matakuliah)
        if matakuliah.save
          render json:{status:'success', message:'matakuliah is saved', data:matakuliah},
          status: :ok
        else
          render json:{status:'error', message:'matakuliah failed to save', data:matakuliah.errors},
          status: :unprocessable_entity
        end
      end

      def update
        matakuliah = Matakuliah.find(params[:id])
        if matakuliah.update_attributes(params_matakuliah)
          render json:{status:'success', message:'matakuliah is update', data:matakuliah},
          status: :ok
        else
          render json:{status:'success', message:'matakuliah failed update', data:matakuliah.errors},
          status: :unprocessable_entity
        end
      end

      private def params_matakuliah
        params.permit(:nama, :semester, :description)
      end

      def show
        matakuliah = Matakuliah.find(params_show[:id])
        render json:{status:'success', message:'matakuliah by id', data:matakuliah},
        status: :ok
      end

      private def params_show
        matakuliah = Matakuliah.find(params[:id])
      end

      def destroy
        matakuliah = Matakuliah.find(params[:id])
        matakuliah.destroy
        render json:{status:'success', message:'matakuliah is delete', data:matakuliah},
        status: :ok
      end

    end
  end
end
