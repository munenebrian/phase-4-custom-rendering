class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.find_by(id: params[:id])
    #render json: cheeses, only: [:id, :name, :is_best_seller]
     if cheese
     render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]
     else
     render json: { error: 'Cheese can not ne found'}, status: :not_found
     end
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    render json: {
      id: cheese.id,
      name: cheese.name,
      price: cheese.price,
      is_best_seller: cheese.is_best_seller
  }
  end

end

