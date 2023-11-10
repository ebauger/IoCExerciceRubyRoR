module Services
  class BackupService
    def initialize(file_service, destination_service, format_service)
      @file_service = file_service
      @destination_service = destination_service
      @format_service = format_service
    end

    def execute_backup(destination)
      files = @file_service.fetch_files
      archived_files = @format_service.archive(files)
      @destination_service.save([archived_files], destination)
    end
  end
end
