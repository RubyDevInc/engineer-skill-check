module ArticlesHelper
  def articles_sort_order(title)
    # 現在のURL(params)がascであれば⇨descへのリンクを生成、でなければascへのリンクを生成
    direction = params[:direction] == 'asc' ? 'desc' : 'asc'
    # このlink_toでparams[:sort]と[:direction]を発生させているっぽい
    link_to title, { direction: direction }
  end
end
