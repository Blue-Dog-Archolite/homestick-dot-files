# require '~/tools/BashProfile/ruby_utility/safe_load'

# IRB.conf[:AUTO_INDENT]=true
# # https://github.com/carlhuda/bundler/issues/183#issuecomment-1149953
# if defined?(::Bundler)
#   global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
#   if global_gemset
#     all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
#     all_global_gem_paths.each do |p|
#       gem_path = "#{p}/lib"
#       $LOAD_PATH << gem_path
#     end
#   end
# end

%w{pry pry-rails irb/completion pp hirb map_by_method rubygems pry-byebug}.each{ |gem| require "#{gem}" }

# Use Pry everywhere
::Pry.start if defined?(::Pry)
exit
