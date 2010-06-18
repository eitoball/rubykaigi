require 'spec_helper'

describe TalksController do
  before do
    stub(controller).basic_auth_required_by_speaker { true }
  end

  describe "GET index" do
    it "exposes all talks" do
      get :index, :year => "2009", :locale => "en"
      response.should be_success
    end
  end

  describe "GET show" do
    before do
      stub(@talk = Talk.new) {
        title { "a talk title" }
        nicovideo_links { "[\"http://test.local/\"]" }
      }
      mock(Talk).year("2009").stub!.find_by_code("37") { @talk }
      get :show, :year => "2009", :locale => "ja", :id => "37"
    end

    it "exposes the requested talk as @talk" do
      assigns[:talk].should == @talk
    end
  end
end
