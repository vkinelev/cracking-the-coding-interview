require 'rake/testtask'
require 'erb'
require 'ostruct'

Rake::TestTask.new do |t|
  # t.libs << "test"
  t.test_files = FileList['test/*.rb']
  # t.verbose = true
end

task :generate, [:problem_name] do |t, args|
  generate_problem_file(args.problem_name)
  generate_test_file(args.problem_name)
end

task :destroy, [:problem_name] do |t, args|
  File.delete(
    problem_file_name(args.problem_name),
    test_file_name(args.problem_name)
  )
end

def problem_file_name(problem_name)
  "./problems/#{problem_name}.rb"
end

def test_file_name(problem_name)
  "./test/#{problem_name}_test.rb"
end

def generate_problem_file(problem_name)
  filename = problem_file_name(problem_name)
  return if File.exist?(filename) && no?("File #{filename} already exists. Overwrite?")

  words = problem_name.split('_')
  problem_header = words.map { |s| s.capitalize }.join(' ')
  context = {
    problem_header: problem_header,
    problem_method_name: words.slice(1, words.length - 1).join('_')
  }
  render_template_to_file(filename,'./templates/problem.rb.erb', context)
end

def generate_test_file(problem_name)
  filename = test_file_name(problem_name)
  return if File.exist?(filename) && no?("File #{filename} already exists. Overwrite?")

  words = problem_name.split('_')
  words = words.slice(1, words.length - 1)
  problem_title = words.map { |s| s.capitalize }.join('')
  context = {
    require_arg: "./problems/#{problem_name}",
    test_class_name: "Test#{problem_title}",
    benchmark_class_name: "Benchmark#{problem_title}",
    problem_method_name: words.join('_')
  }
  render_template_to_file(filename,'./templates/test.rb.erb', context)
end

def render_template_to_file(filename, template, context)
  erb_template = ERB.new(File.read(template))
  data = erb_template.result(OpenStruct.new(context).instance_eval { binding })
  File.write(filename, data)
end

def yes?(question)
  puts "#{question} (Y)es, (N)no"
  loop do
    case $stdin.gets.strip.downcase
    when "n", "no"
      return false
    when "y", "yes"
      return true
    end
  end
end

def no?(question)
  !yes?(question)
end
