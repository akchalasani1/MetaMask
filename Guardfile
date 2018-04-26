# More info at https://github.com/guard/guard#readme
# Guardfile examples also here: https://github.com/guard/guard/wiki/Guardfile-examples

guard 'rake', :task => 'default' do
  watch(%r{features/step_definitions/(.+)\.rb})
  watch(%r{features/support/(.+)\.rb})
  watch(%r{features/(.+)\.feature})
end
