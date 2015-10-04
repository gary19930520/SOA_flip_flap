# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    line_arr = tsv.split(/\n/) #parse every line
    list_name = line_arr[0].split("\t")
    # puts line_arr[0]
    line_arr.shift # remove first item list_name
    @data = [] # where to store
    line_arr.each do |line|
      values_arr = line.split("\t")
      tmp_hash = {}
      list_name.each_index do |index|
        tmp_hash[list_name[index]] = values_arr[index].chomp
      end
      @data.push(tmp_hash)
    end
    @data # return
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    output_str = ''
    @data.each_with_index do |item, itemIdx|
      first_flag = true
      tmp_str = ''
      item.each do |key, value|
        output_str += first_flag ? "#{key}" : "\t#{key}" if itemIdx == 0
        tmp_str += first_flag ? "#{value}" : "\t#{value}"
        first_flag = false
        # p value
      end
      output_str += "\n" if itemIdx == 0
      output_str += "#{tmp_str}\n"
    end
    output_str
  end
end
