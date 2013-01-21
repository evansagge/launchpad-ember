# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rails', port: 4000 do
  watch('Gemfile.lock')
  watch(%r{^config/environment.*})
  watch(%r{^config/initializers.*})
  watch(%r{^config/application.*})
  watch(%r{^config/boot.*})
  watch(%r{^lib/.*})
end


guard 'bundler' do
  watch('Gemfile')
  # Uncomment next line if Gemfile contain `gemspec' command
  # watch(/^.+\.gemspec/)
end
