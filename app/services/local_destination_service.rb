# app/services/local_destination_service.rb
module Services
  class LocalDestinationService
    include DestinationService

    def save(files, destination)
      files.each do |file|
        ::File.binwrite(::File.join(destination, file.name), file.content)
      end
    end
  end
end
