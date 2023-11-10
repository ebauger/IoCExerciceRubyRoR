# app/services/destination_service.rb
module Services
  module DestinationService
    def save(files, destination)
      raise NotImplementedError, "#{self.class.name}#save is not implemented"
    end
  end
end
