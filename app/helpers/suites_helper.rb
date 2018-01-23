module SuitesHelper
  def render_tree(roots)
    return ''.html_safe if roots.empty?
    content_tag(:ul) do
      roots.map do |root|
        content_tag(:li) do
          link_to(root.title, '#') + render_tree(root.children)
        end
      end.join.html_safe
    end
  end
end
