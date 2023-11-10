# lib/tasks/backup.rake
require_relative '../../app/services/file'
require_relative '../../app/services/file_list_service'
require_relative '../../app/services/sqlite_file_list_service'
require_relative '../../app/services/destination_service'
require_relative '../../app/services/local_destination_service'
require_relative '../../app/services/format_archive'
require_relative '../../app/services/zip_format_archive'
require_relative '../../app/services/backup_service'

namespace :backup do
  desc "Run the backup service"
  task run: :environment do
    file_service = Services::SQLiteFileListService.new
    destination_service = Services::LocalDestinationService.new
    format_service = Services::ZipFormatArchive.new

    backup_service = Services::BackupService.new(
      file_service,
      destination_service,
      format_service
    )

    backup_directory = 'backups'
    Dir.mkdir(backup_directory) unless Dir.exist?(backup_directory)

    backup_service.execute_backup(backup_directory)
  end
end
