module ArticlesHelper
  def sort_order
    direction = params[:direction] == 'asc' ? 'desc' : 'asc'
    link_to title, { direction: direction }
  end
end
