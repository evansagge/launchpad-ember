namespace :launchpad do

  namespace :models do
    task :render_html_content => :environment do
      Article.all.each do |a|
        a.send(:render_html_content)
        a.save!
      end

      Page.all.each do |p|
        p.send(:render_html_content)
        p.save!
      end      
    end
  end
  
end