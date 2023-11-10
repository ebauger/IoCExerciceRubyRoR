module Services
  module FormatArchive
    def archive(files)
      raise NotImplementedError, "#{self.class.name}#archive is not implemented"
    end
  end
end
