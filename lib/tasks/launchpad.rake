namespace :launchpad do

  namespace :articles do
    task :render_html_content => :environment do
      Article.all.each do |a|
        a.send(:render_html_content)
        a.save!
      end
    end
  end
  
end