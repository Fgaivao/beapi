class Api::V1::DeclarationsController < ApplicationController

  def index
    @declarations = Declaration.all
    render json: @declarations
  end

  def show
    @declaration = Declaration.find(params[:id])
    render json: @declaration
  end

  def create
    @declaration = Declaration.new(declaration_params)
    if @declaration.save
      render json: @declaration
    else
      render error: {error: 'Unable to create Declaration'}
    end

  end

  def update
    @declaration = Declaration.find(params[:id])
    if @declaration
      @declaration.update(declaration_params)
      render json: {message: 'Declaration successfully updated'}
    else
      render json: {error: 'Unable to update Declaration'}
    end
  end

  def destroy
    @declaration = Declaration.find(params[:id])
    if @declaration
      @declaration.destroy
      render json: {message: 'Declaration successfully deleted'}
    else
      render json: {error: 'Unable to delete Declaration'}
    end

  end

  private

  def declaration_params
    params.require(:declaration).permit(:document, :user_id)
  end
end
