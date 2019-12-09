require 'down'

class ImageFetcher
  attr_reader :file_path, :destination_path

  def initialize(file_path:)
    @file_path = file_path
  end

  def run
    raise "Error: please enter a valid source file" unless File.exist?(file_path)

    File.foreach(file_path).each { |url| download_image(url) }
  end

  private

  def download_image(url)
    begin
      Down.download(url, destination: destination_path)

      puts "Success: downloaded image #{url}"
    rescue
      puts "Error: cannot download image #{url}"    
    end
  end

  def destination_path
    return @destination_path if defined?(@destination_path)

    @destination_path = File.dirname(file_path) + '/images'
    FileUtils.mkdir_p(@destination_path)

    @destination_path
  end
end
