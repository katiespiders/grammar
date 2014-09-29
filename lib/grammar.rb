class Grammar
  def self.to_phrase(list, separator: 'and', oxford: true)
    if list.length > 2
      phrase = ''

      i = 0
      (list.length-2).times do
        phrase += list[i] + ', '
        i += 1
      end

      comma = oxford ? ',' : ''
      return "#{phrase}#{list[-2]}#{comma} #{separator.strip} #{list.last}"

    elsif list.length == 2
      return list.join(' ' + separator.strip + ' ')

    else
      return list[0]
    end
  end

  def self.add_article(word, plural: false, definite: false)
    if definite
      'the ' + word
    elsif plural
      'some ' + word
    else
      vowels = 'aeiou'
      (vowels.include? word[0].downcase) ? ('an ' + word) : ('a ' + word)
    end
  end

  def self.plural?(word)
    word[-1] == 's'
  end
end
