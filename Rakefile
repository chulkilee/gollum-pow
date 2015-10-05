ROOT_DIR = File.expand_path(__dir__)
DATA_DIR = File.expand_path('data', __dir__)
TMP_DIR = File.expand_path('tmp', __dir__)
POW_DIR = "#{ENV['HOME']}/Library/Application Support/Pow"
SYMLINK_PATH = "#{ENV['HOME']}/.pow/gollum"

unless Dir.exist? DATA_DIR
  $stderr.puts "#{DATA_DIR} does not exist"
  exit 1
end

Dir.mkdir TMP_DIR unless Dir.exist? TMP_DIR

namespace :pow do
  desc 'install pow'
  task :install do
    if Dir.exist? POW_DIR
      $stderr.puts 'pow is already installed'
    else
      sh 'curl get.pow.cx | sh'
    end
  end

  desc 're-install pow'
  task :reinstall do
    sh 'curl get.pow.cx | sh'
  end
end

namespace :gollum_pow do
  desc 'link pow'
  task :link do
    if File.symlink? SYMLINK_PATH
      $stderr.puts 'symlink already exists'
    elsif File.exist? SYMLINK_PATH
      $stderr.puts "#{SYMLINK_PATH} exists but it is not symlink"
    else
      File.symlink ROOT_DIR, SYMLINK_PATH
    end
  end

  desc 'unlink pow'
  task :unlink do
    if File.symlink? SYMLINK_PATH
      File.unlink SYMLINK_PATH
    elsif File.exist? SYMLINK_PATH
      $stderr.puts "#{SYMLINK_PATH} exists but it is not symlink"
    else
      $stderr.puts 'symlink does not exist'
    end
  end

  desc 'restart pow'
  task :restart do
    FileUtils.touch File.join(ROOT_DIR, 'tmp', 'restart.txt')
  end

  desc 'open pow'
  task :open do
    sh 'open http://gollum.dev'
  end
end
