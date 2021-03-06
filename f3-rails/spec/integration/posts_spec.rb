require 'spec_helper'

describe 'A post' do
  fixtures :posts
  
  context 'being viewed by a search engine' do
    before do
      @post = posts(:with_seo)
    end

    it "should contain the SEO fields" do
      visit post_path(@post)
      within('head title') { page.should have_content(@post.seo_title) }
      within('head') do
        page.should have_selector('meta', :name => "description", :content => @post.seo_description)
        page.should have_selector('meta', :name => "keywords", :content => @post.seo_keywords)  
      end
    end
  end
end