# frozen_string_literal: true

class HelloWorldController < ApplicationController
  layout "hello_world"

  def index
    @hello_world_props = { name: "Stranger" }
  end

  def new
        @register = Register.new
        respond_to do |format|
          format.html
          format.json { render json: @register}
        end
      end

  def create
    @register = Register.new(register_params)

    respond_to do |format|
      if @register.save
        format.html { redirect_to @register, notice: "Save process completed!" }
        format.json { render json: @register, status: :created, location: @register }
      else
        format.html {
          flash.now[:notice]="Save proccess coudn't be completed!"
          render :new
        }
        format.json { render json: @register.errors, status: :unprocessable_entity}
      end
    end
  end

  private
  def register_params
    params.permit(:name, :email, :password)
  end

end
