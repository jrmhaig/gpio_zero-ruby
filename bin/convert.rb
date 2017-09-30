#!/usr/bin/env ruby

filename = ARGV[0]

const = ''
File.open(filename, 'r') do |file|
  file.each_line do |line|
    next if line.match(/^\s*#/)
#    puts ">> #{line}"
    if new_const = line.match(/^([A-Z0-9_]+) = {/)
      const = new_const[1]
      puts "#{const} = {"
    elsif new_const = line.match(/^([A-Z0-9_]+)/)
      puts "# TODO Something with '#{new_const[0]}'"
      puts
    elsif line.match(/^\s*}\s*$/)
      const = ''
      puts "}"
      puts
    elsif const == 'PI_REVISIONS'
      key_values=line.split(/:\s*\(/)
      puts "  #{key_values[0].strip} => {"
      split = key_values[1].split(/,\s*/, 14)
      puts "    model: #{split[0]},"
      puts "    pcb_rev: #{split[1]},"
      puts "    released: #{split[2]},"
      puts "    soc: #{split[3]},"
      puts "    manufacturer: #{split[4]},"
      puts "    ram: #{split[5].to_i},"
      puts "    storage: #{split[6]},"
      puts "    usb: #{split[7].to_i},"
      puts "    eth: #{split[8].to_i},"
      puts "    wifi: #{split[9].downcase},"
      puts "    bt: #{split[10].downcase},"
      puts "    csi: #{split[11].to_i},"
      puts "    dsi: #{split[12].to_i},"
      the_rest = split[13].match(/{(.+)},\s*([A-Z0-9_]+)/)
      puts "    headers: {"
      the_rest[1].split(/,\s*/).each do |header|
        header_split = header.match(/'(.+)': (.+)/)
        puts "      #{header_split[1].downcase}: #{header_split[2]},"
      end
      puts "    },"
      # Do not have board layout diagrams yet
      #puts "    board: #{the_rest[2]}"
      puts "  },"
    elsif const != ''
      data = line.split(/(\d+):\s*\((.+),\s*(.+)\),\s*(\d+):\s*\((.+),\s*(.+)\)/)
      puts "  #{data[1]} => { function: #{data[2]}, pullup: #{data[3].downcase} },"
      puts "    #{data[4]} => { function: #{data[5]}, pullup: #{data[6].downcase} },"
    end
  end
end
