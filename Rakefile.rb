require 'cucumber'
require 'cucumber/rake/task'

task default: :features

task :features do 
  mkdir_p "./results"
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty --tags ~@wip"
end


task :clean do
  rm_rf "./results"
end
