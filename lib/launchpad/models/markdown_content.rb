module Launchpad
  module Models
    module MarkdownContent
      extend ActiveSupport::Concern

      included do
        field :content
        field :html_content

        alias_attribute :body, :html_content

        validates :content, presence: true    

        before_save :render_html_content#, if: ->(a) { a.new_record? or a.content_changed? }
      end

      protected

      def render_html_content
        markdown_to_html = Redcarpet::Markdown.new(
          Redcarpet::Render::BetterHTML.new(filter_html: true, hard_wrap: true),
          {
            fenced_code_blocks: true,
            no_intra_emphasis: true,
            autolink: false,
            strikethrough: true,
            lax_html_blocks: true,
            superscript: true
          }
        )
        self.html_content = markdown_to_html.render(content).html_safe.strip
      end
    end
  end
end

class Redcarpet::Render::BetterHTML < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants

  def block_code(code, language)
    ::CodeRay.scan(code, language).div(
      line_numbers: :inline, 
      line_number_anchors: true,
      tab_width: 2
    )
  end

  def image(link, title, alt_text)
    if alt_text =~ /^(embed|video|youtube|vimeo|soundcloud)$/
      oembed = OEmbed::Providers.get(link)
      %q(<div class="embedded %s %s">%s</div>) % [oembed.type, oembed.provider_name.parameterize, oembed.html]
    else
      super(link, title, alt_text)
    end
  end
end
