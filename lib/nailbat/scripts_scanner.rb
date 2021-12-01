class Nailbat::ScriptsScanner
  def self.load
    out = []
    dir = File.join(File.expand_path('~'), '.nailbat')
    Dir.mkdir(dir) unless Dir.exist?(dir)

    nailbat_files = File.join(dir, "**", "*.nailbat.*")
    files = Dir.glob(nailbat_files)

    files.each do |file|
      yaml = ""
      yaml_found = false

      File.foreach(file).with_index do |line, line_number|
        break if line_number > 20
        yaml << line
        if line.strip == "..."
          yaml_found = true
          break
        end
      end

      if yaml_found
        config = YAML.load(yaml)
        config["path"] = file
        out << config
      end
    end

    out
  end
end
