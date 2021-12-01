class Nailbat::ScriptPicker
  def self.pick(scripts)
    prompt = TTY::Prompt.new
    longest = scripts.max {|a, b| a["name"].length <=> b["name"].length}
    length = longest["name"].length

    choices = Hash[scripts.map do |s|
      [
        "#{s["name"].ljust(length)} (#{s["description"]})",
        s["path"]
      ]
    end]
    prompt.select("Script select:", choices, filter: true)
  end
end
