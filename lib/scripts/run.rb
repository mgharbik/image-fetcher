require_relative '../image_fetcher.rb'

ImageFetcher.new(file_path: ARGV[0]).run
