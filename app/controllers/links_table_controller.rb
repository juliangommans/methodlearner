class LinksTableController < ActionController::Base
  def index
    @links = LinksTable.where(method_type: params[:method_type], language: params[:language])
  end

  def show
    @link = LinksTable.find(params[:id])
  end
end
