module EmployeesHelper
  def employees_sort_order(column, title)
    # 現在のURL(params)がdescであれば⇨ascへのリンクを生成、でなければdescへのリンクを生成
    direction = params[:direction] == 'desc' ? 'asc' : 'desc'
    # このlink_toでparams[:sort]と[:direction]を発生させているっぽい
    link_to title, { sort: column, direction: direction }
  end
end
