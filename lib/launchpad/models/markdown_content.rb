module Launchpad
  module Models
    module MarkdownContent
      extend ActiveSupport::Concern

      included do
        field :content
        field :html_content

        alias_attribute :body, :html_content

        validates :content, presence: true    

        before_save :render_html_content, if: ->(a) { a.new_record? or a.content_changed? }
      end

      protected

      def render_html_content
        formatter = Slodown::Formatter.new(content)
        self.html_content = formatter.complete.to_s
      end

    end
  end
end