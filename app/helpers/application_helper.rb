# ApplicationHelper
module ApplicationHelper
  def markdown(content)
    opitions = {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      lax_spacing: true,
      strikethrough: true,
      superscript: true,
      hard_wrap: true,
      prettify: true
    }
    renderer = Redcarpet::Render::HTML.new(opitions)
    Redcarpet::Markdown.new(renderer, extensions).render(content).html_safe
  end
end
