# app/services/sqlite_file_list_service.rb
require 'sqlite3'

module Services
  class SQLiteFileListService
    # Assuming we have a SQLite database named "files.db" with a table "files"
    DB_NAME = Rails.root.join('app', 'services', 'files.db').to_s

    # CREATE TABLE files (
    #     id INTEGER PRIMARY KEY AUTOINCREMENT,
    #     name TEXT NOT NULL,
    #     content BLOB NOT NULL
    # );

    # -- Inserting first dummy file
    # INSERT INTO files (name, content) VALUES ('file1.txt', 'This is the content of file1.');

    # -- Inserting second dummy file
    # INSERT INTO files (name, content) VALUES ('file2.txt', 'Content for file2 goes here.');

    # -- Inserting third dummy file
    # INSERT INTO files (name, content) VALUES ('file3.txt', 'And this is for file3.');

    # Assuming you've defined a File struct with name and content attributes
    # File = Struct.new(:name, :content)
    include Services::FileListService

    def fetch_files
      files = []
      SQLite3::Database.open(DB_NAME) do |db|
        db.execute("SELECT name, content FROM files") do |row|
          name, content = row
          files << File.new(name, content)
        end
      end
      files
    end
  end
end
