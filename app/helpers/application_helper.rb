module ApplicationHelper
  def highlight?(test_path)
    'header-menu-item-selected' if request.path == test_path
  end
end
