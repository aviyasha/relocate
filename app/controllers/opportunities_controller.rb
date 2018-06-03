class OpportunitiesController < ApplicationController
	def index
	end

	def find
  	response = Opportunity.where("title LIKE ?" , "%#{opportunities_query_params[:title]}%")
  	
  	return render json: { status: 'success', count: response.count, results: response }
  end

  private

  def opportunities_query_params
  	params.require(:opportunities_query).permit(
      :title,
      :location
    )
  end
end
