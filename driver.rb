class Driver
  attr_reader :single_values_hash

  def initialize
    @single_values_hash = Hash.new(0)
    
    # Inititalize key/value so the keys will show up first when printing the hash.
    single_values_hash[:lines_processed] = 0
    single_values_hash[:lines_skipped]   = 0
  end

  def run
    i=0
    File.readlines('input/passwords_10000_small.txt').each do |line|
      i+=1

      puts line.inspect
      process_line(line)
      break if i >= 300
    end

    print_stats
  end

  private

  def print_stats
    single_values_hash.each do |key, value|
      puts "#{key}: #{value}"
    end
  end

  def process_line(line)
    single_values_hash[:lines_processed] += 1

    line.strip!
    if line.size == 0
      single_values_hash[:lines_skipped] += 1
      return
    end

    single_values_hash[:lines_with_1]   += 1 if line.index("1")
    single_values_hash[:lines_with_12]  += 1 if line.index("12")
    single_values_hash[:lines_with_123] += 1 if line.index("123")
    single_values_hash[:lines_with_321] += 1 if line.index("321")
    single_values_hash[:lines_with_987] += 1 if line.index("987")

    single_values_hash[:lines_with_abc] += 1 if line.index("abc")

    single_values_hash[:lines_with_qwer] += 1 if line.index("qwer")

    single_values_hash[:lines_with_sex] += 1 if line.index("sex")
    single_values_hash[:lines_with_password] += 1 if line.index("password")
    single_values_hash[:lines_with_god] += 1 if line.index("god")

    single_values_hash[:lines_end_with_1] += 1 if line =~ /1$/
    single_values_hash[:lines_end_with_digit] += 1 if line =~ /[0-9]$/

    single_values_hash[:lines_with_all_digits] += 1 if line =~ /^[0-9]+$/
    single_values_hash[:lines_with_all_lower_alpha] += 1 if line =~ /^[a-z]+$/
    single_values_hash[:lines_with_all_upper_alpha] += 1 if line =~ /^[A-Z]+$/
  end

end

d = Driver.new
d.run
