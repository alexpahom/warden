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
    return ''.html_safe if roots.blank?
    content_tag(:ul) do
      roots.map do |root|
        content_tag(:li) do
          render_block root
        end
      end.join.html_safe
    end
  end

  def render_block(section)
    content_tag(:div, nil, class: 'section-block') do
      content_tag(:span, section.title, class: 'section-name') +
          render('suites/section-header', locals: { parent: section.id }) +
            render_cases(section.children)
    end
  end
end
