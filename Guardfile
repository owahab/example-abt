# frozen_string_literal: true

guard 'puma', config: File.expand_path('config/puma.rb', __dir__) do
  watch 'Gemfile.lock'
  watch(%r{^app/models/(.+)\.rb})
  watch(%r{^app/views/(.+)\.slim})
  watch(%r{^app/(.+)_(controller)\.rb})
  watch(%r{^app/assets/styles/(.+)\.css})
end
