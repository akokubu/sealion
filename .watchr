@spec_cmd = "bundle exec spring rspec"
@cuc_cmd  = "bundle exec spring cucumber"

# Run specs, cucumber ###############################################################
def run_all_specs
  run "#{@spec_cmd} spec/"
end

def run_spec(spec)
  run "#{@spec_cmd} #{spec}"
end

def run_all_features
  run @cuc_cmd
end
 
def run_feature(feature)
  run "#{@cuc_cmd} #{feature}"
end

# Run command ###############################################################
def run(command)
  puts "\n\n"
  puts command

  result = system command
  notify result

  puts "\n\n"
end

# Notify ###############################################################
def notify(result)

  title = "Failure..."
  info = "Please check the error message ..."

  require 'rubygems'
  require 'terminal-notifier-guard'

  if result == false then
    TerminalNotifier::Guard.failed(info, :subtitle => title)
  end
end

# util ###############################################################
def related_specs(path)
  Dir['spec/**/*.rb'].select do |file|
    file =~ /#{File.basename(path).split('.').first}_spec.rb/
  end
end


# Watchr rules ###############################################################
watch('spec/spec_helper\.rb') { run_all_specs }
watch('spec/support/.*') { run_all_specs }
watch('spec/.*/*_spec\.rb') { |match| run_spec match[0] }
watch('app/.*.rb') { |match| related_specs(match[0]).map { |spec| run_spec spec } }
watch('lib/.*\.rb') { |match| related_specs(match[0]).map { |spec| run_spec spec } }
watch('features/support/.*') { |match| run_all_features }
watch('features/.*\.feature') { |match| run_feature match[0] }



