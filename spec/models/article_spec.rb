require 'spec_helper'

describe Article do

  context "given a new Article" do
    let(:content) { "*This* **is** a `sample` content text." }
    let(:article) { Fabricate :article, content: content }

    describe "#save" do
      before { article.save! }

      it "saves the original content into :content" do
        expect(article.content).to eq content
      end

      it "creates an HTML version of the original content into :html_content" do
        expect(article.html_content).to eq "<p><em>This</em> <strong>is</strong> a <code>sample</code> content text.</p>"
      end
    end
  end
end