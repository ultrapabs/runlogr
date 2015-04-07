module ApplicationHelper

  def auth_token
    <<-HTML.html_safe
    <input type="hidden"
           name="authenticity_token"
           value="#{ form_authenticity_token }">
    HTML
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(render_options = { escape_html: true}),
      extensions = {no_intra_emphasis: true, strikethrough: true}
    )

    markdown.render(text).html_safe
  end

end
