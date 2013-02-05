require 'spec_helper'

describe PagesController do
  let(:page) { mock_model(Page) }
  before { Page.stub(:find_by).and_return(page) }

  describe "GET show" do
    before { get :show, id: page.to_param }

    it "assigns the requested page as @page" do
      assigns(:page).should eq(page)
    end
  end

end
