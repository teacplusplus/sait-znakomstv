#encoding: UTF-8
class LangCorrect

      REPLACES = {
          #CASE_UPPER         #case_lower
          "Ё" => '~',  "а" => '`', #Ё ё
          "А" => 'F',  "а" => 'f', #А а
          "Б" => '<',  "б" => ',', #Б б
          "В" => 'D',  "в" => 'd', #В в
          "Г" => 'U',  "г" => 'u', #Г г
          "Д" => 'L',  "д" => 'l', #Д д
          "Е" => 'T',  "е" => 't', #Е е
          "Ж" => ':',  "ж" => ';', #Ж ж
          "З" => 'P',  "з" => 'p', #З з
          "И" => 'B',  "и" => 'b', #И и
          "Й" => 'Q',  "й" => 'q', #Й й
          "К" => 'R',  "к" => 'r', #К к
          "Л" => 'K',  "л" => 'k', #Л л
          "М" => 'V',  "м" => 'v', #М м
          "Н" => 'Y',  "н" => 'y', #Н н
          "О" => 'J',  "о" => 'j', #О о
          "П" => 'G',  "п" => 'g', #П п
          #CASE_UPPER         #case_lower
          "Р" => 'H',  "р" => 'h', #Р р
          "С" => 'C',  "с" => 'c', #С с
          "Т" => 'N',  "т" => 'n', #Т т
          "У" => 'E',  "у" => 'e', #У у
          "Ф" => 'A',  "ф" => 'a', #Ф ф
          "Х" => '{',  "х" => '[', #Х х
          "Ц" => 'W',  "ц" => 'w', #Ц ц
          "Ч" => 'X',  "ч" => 'x', #Ч ч
          "Ш" => 'I',  "ш" => 'i', #Ш ш
          "Щ" => 'O',  "щ" => 'o', #Щ щ
          "Ь" => '}',  "ъ" => ']', #Ъ ъ
          "Ы" => 'S',  "ы" => 's', #Ы ы
          "ь" => 'M',  "ь" => 'm', #Ь ь
          "Э" => '"',  "э" => "'", #Э э
          "Ю" => '>',  "ю" => '.', #Ю ю
          "Я" => 'Z',  "я" => 'z', #Я я
      }

  INVERT_REPLACES = REPLACES.invert


  def self.make(str)
    result = ''
    str.to_s.each_char do |char|
      if INVERT_REPLACES.has_key?(char)
        result << INVERT_REPLACES[char]
      else
        result << char
      end
    end
    return result
  end


  def self.unmake(str)
    result = ''
    str.to_s.each_char do |char|
      if REPLACES.has_key?(char)
        result << REPLACES[char]
      else
        result << char
      end
    end
    return result
  end



end