module SuitesHelper
  def render_tree(roots)
    return ''.html_safe if roots.empty?
    content_tag(:ul) do
      roots.map do |root|
        content_tag(:li) do
          link_to(root.title, '') + render_tree(root.children)
        end
      end.join.html_safe
    end
  end

  def render_cases(roots)
    return ''.html_safe if roots.blank?
    content_tag(:ul) do
      roots.map do |root|
        content_tag(:li) { render_block root }
      end.join.html_safe
    end
  end

  def render_block(section)
    content_tag(:div, nil, class: 'section-block') do
      render('suites/section-header',
             locals: { parent: section.id,
                       title: section.title,
                       obj: section,
                       tcases: section.cases }) +
          render_cases(section.children)
    end
  end
end
