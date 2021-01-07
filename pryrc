# Add color coding based on Rails environment for safety

if defined? Rails
  banner = if Rails.env.production?
    "\e[41;97;1m #{Rails.env} \e[0m "
  else
    "\e[42;97;1m #{Rails.env} \e[0m "
  end

  original_prompt = Pry.config.prompt
  Pry.config.prompt = Pry::Prompt.new(
    "custom",
    "my custom prompt",
    [
      proc { |*args| "#{banner} #{original_prompt.prompt_procs.first.call(*args) }"  },
      original_prompt.prompt_procs.last
    ]
  )
end
