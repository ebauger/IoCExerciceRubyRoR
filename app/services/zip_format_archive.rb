require 'zip'

module Services
  class ZipFormatArchive
    include Services::FormatArchive

    def archive(files)
      buffer = Zip::OutputStream.write_buffer do |out|
        files.each do |file|
          out.put_next_entry(file.name)
          out.write(file.content)
        end
      end
      buffer.rewind # Necessary to read the buffer from the beginning
      zip_content = buffer.read

      # Assuming you have a File struct or class defined
      File.new('archive.zip', zip_content)
    end
  end
end
