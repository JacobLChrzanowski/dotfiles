#!/usr/bin/env ruby

require 'erb'
require 'yaml'
require 'fileutils'

class TmuxThemeSystem
  def initialize(
    dir_themes = '~/.config/tmux/scripts/themes',
    file_template = '~/.config/tmux/scripts/themes/style.conf.erb',
    file_output_gen = "~/.config/tmux/style.conf"
  )
    @dir_themes = File.expand_path(dir_themes)
    @file_template = File.expand_path(file_template)
    @file_output_gen = File.expand_path(file_output_gen)
    
    @status_left = ""
    @status_right = ""
  end

  # def setup_directories
  #   FileUtils.mkdir_p(@themes_dir)
  #  
  #   # Create the ERB template
  #   File.write(@template_file, @template_content)
  #  
  #   # Create sample theme files
  #   create_sample_themes
  #  
  #   puts "Theme system created!"
  #   puts "- Themes directory: #{@themes_dir}/"
  #   puts "- Template file: #{@template_file}"
  # end

  def list_themes
    theme_files = Dir.glob("#{@dir_themes}/*.yml")
    
    if theme_files.empty?
      puts "No themes found in #{@dir_themes}/"
      return
    end

    puts "Available themes:"
    theme_files.each do |file|
      theme_name = File.basename(file, '.yml')
      theme_data = YAML.load_file(file)
      puts "  #{theme_name.ljust(20)} - #{theme_data['description'] || 'No description'}"
    end
  end

  def generate_theme(theme_name)
    theme_file = "#{@dir_themes}/#{theme_name}.yml"

    unless File.exist?(theme_file)
      puts "Theme '#{theme_name}' not found!"
      list_themes
      return false
    end

    # Load theme configuration
    @config = YAML.load_file(theme_file)

    # Build left status so length is known in advance
    build_status_left()
    build_status_right()

    # Generate the tmux configuration
    template = ERB.new(File.read(@file_template))
    result = template.result(binding)

    File.write(@file_output_gen, result)

    puts "Generated: #{@file_output_gen}"
    
    if ENV.has_key?("TMUX") and ENV["TMUX"] != ""
      %x(tmux source-file "#{@file_output_gen}")
      puts "Reloaded style.conf" 
    end
    true
  end

  def build_status_left
    gradient = @config['colors']['gradient']
    separator = @config['symbols']['separator_left']
    session_fg = @config['colors']['session_fg']
    session_bg = @config['colors']['session_bg'] || gradient[0]
    prefix = @config['symbols']['session_prefix']
    suffix = @config['symbols']['session_suffix']
    segments = []
    
    # First segment with session info
    segments << "\\#[fg=#{session_fg},bg=#{session_bg}]#{prefix}\\#S#{suffix}"
    
    # Gradient segments
    (0...gradient.length - 1).each do |i|
      segments << "\\#[fg=#{gradient[i]},bg=#{gradient[i + 1]}]#{separator}"
    end

    segments << " "
    @status_left = segments.join('')
  end

  def _color(fg="#ffffff", bg="#000000")
    "#[fg=#{fg},bg=#{bg}]"
  end

  def build_status_right
    separator = @config['symbols']['separator_right']
    colors    = @config['colors']
    c_stat_bg = @config['colors']['status_bg']
    c_stat_r  = @config['colors']['status_right']
    date_fg = c_stat_r['date_fg']
    date_bg = c_stat_r['date_bg']
    time_fg = c_stat_r['time_fg']
    time_bg = c_stat_r['time_bg']
    fmt_r    =  @config['format']['status_right']
    fmt_date = fmt_r['date']
    fmt_time = fmt_r['time']
    segments = []

    # Date
    segments << "#{_color(fg=date_bg, bg=c_stat_bg)}#{separator}"
    segments << "#{_color(fg=date_fg, bg=date_bg)}#{fmt_date}"
    # Date/Time Separator
    segments << "#{_color(fg=time_bg, bg=date_bg)}#{separator}"
    # Time
    segments << "#{_color(fg=time_fg, bg=time_bg)}#{fmt_time}"

    @status_right = segments.join('')
  end

  def build_active_window
    status_bg = @config['colors']['status_bg']
    active_bg = @config['colors']['active_window_bg']
    active_fg = @config['colors']['active_window_fg']
    separator = @config['symbols']['separator_middle']

    "\\#[fg=#{status_bg},bg=#{active_bg}]#{separator} " \
    "\\#[fg=#{active_fg},bg=#{active_bg}]\\#I: \\#W\\#F " \
    "\\#[fg=#{active_bg},bg=#{status_bg}]#{separator}"
  end

  def build_inactive_window
    status_bg = @config['colors']['status_bg']
    inactive_bg = @config['colors']['inactive_window_bg']
    inactive_fg = @config['colors']['inactive_window_fg']
    separator = @config['symbols']['separator_middle']

    "\\#[fg=#{status_bg},bg=#{inactive_bg}]#{separator} " \
    "\\#[fg=#{inactive_fg},bg=#{inactive_bg}]\\#I:\\#W\\\#{?window_flags,\\\#{window_flags}, }" \
    "\\#[fg=#{inactive_bg},bg=#{status_bg}]#{separator}"
  end

  def create_template_theme(theme_name)
    theme_template = {
        'name' => 'Template Theme',
        'description' => 'Template',
        'colors' => {
          'status_bg'  => '#655a7c',
          'session_fg' => '#ffffff',
          'session_bg' => '#1d1a24',
          'gradient'   => [
            '#1d1a24', '#292532', '#352f41', 
            '#413a50', '#4d455e', '#594f6d', '#655a7c'
          ],
          'active_window_bg'   => '#ab92bf',
          'active_window_fg'   => 'black',
          'inactive_window_bg' => '#4d455e',
          'inactive_window_fg' => '#cccccc'
        },
        'symbols' => {
          'separator_left'   => '◣',
          'separator_middle' => '◣',
          'separator_right'  => '◢',
          'session_prefix'   => '[',
          'session_suffix'   => '] '
        },
        'status_right' => '%a %Y.%m.%d %I:%M:%S'
    }

    File.write(
      "#{@dir_themes}/#{theme_name}.yml",
      theme_template.to_yaml
    )
  end
end

# CLI Interface
if __FILE__ == $0
  system = TmuxThemeSystem.new

  case ARGV[0]
  when 'list'
    system.list_themes
  when 'generate'
    if ARGV[1]
      system.generate_theme(ARGV[1])
    else
      puts "Usage: #{$0} generate <name>"
      system.list_themes
    end
  when 'template'
    if ARGV[1]
      system.create_template(ARGV[1])
    else
      puts "Usage: #{$0} template <name>"
    end
  else
    puts 'Tmux Theme System'
    puts "Usage:"
    puts "  #{$0} list            - List available themes"  
    puts "  #{$0} generate <name> - Generate tmux config for theme"
    puts "  #{$0} template <name> - Create new tmux theme template"
  end
end
