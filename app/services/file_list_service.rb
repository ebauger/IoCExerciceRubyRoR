# app/services/file_list_service.rb
module Services
  module FileListService
    def fetch_files
      raise NotImplementedError, "#{self.class.name}#fetch_files is not implemented"
    end
  end
end
