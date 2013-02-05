require 'spec_helper'

describe Page do

  context "given a new Page" do
    let(:content) { "*This* **is** a `sample` content text." }
    let(:page) { Fabricate :page, content: content }

    describe "#save" do
      before { page.save! }

      it "saves the original content into :content" do
        expect(page.content).to eq content
      end

      it "creates an HTML version of the original content into :html_content" do
        expect(page.html_content).to eq "<p><em>This</em> <strong>is</strong> a <code>sample</code> content text.</p>"
      end
    end

  end

end