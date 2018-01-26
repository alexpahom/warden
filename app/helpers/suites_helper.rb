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

  def render_cases(roots)
    return ''.html_safe if roots.empty?
    content_tag(:ul) do
      roots.map do |root|
        content_tag(:li) do
          content_tag(:div, nil, class: 'section-block') do
            content_tag(:span, root.title, class: 'section-name') +
                render('suites/section-header', locals: { parent: root.id }) +
                  render_cases(root.children)
          end
        end
      end.join.html_safe
    end
  end
end
