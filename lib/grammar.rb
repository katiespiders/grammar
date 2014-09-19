class Grammar
  def initialize
    puts "HALT THIS IS THE GRAMMAR POLICE"
  end

  def Grammar.list_to_text(list, separator: 'and', oxford: true)
    if list.length > 2
      text = ""

      i = 0
      (list.length-2).times do
        text += list[i] + ", "
        i += 1
      end

      comma = oxford ? "," : ""
      text = "#{text}#{list[-2]}#{comma} #{separator.strip} #{list.last}"
      return text

    elsif list.length == 2
      return list.join(" " + separator.strip + " ")

    else
      return list[0]
    end
  end

end
