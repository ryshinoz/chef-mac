current_dir = File.expand_path(File.dirname(__FILE__))
file_cache_path "#{current_dir}/../.chef/cache"
cookbook_path ["#{current_dir}/../cookbooks", "#{current_dir}/../site-cookbooks"]
