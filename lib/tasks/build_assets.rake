task :build_assets do
  sh 'yarn'
end

Rake::Task['assets:precompile'].enhance([:build_assets])
