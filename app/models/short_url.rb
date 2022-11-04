class ShortUrl < ApplicationRecord
  CHARACTERS = [*'0'..'9', *'a'..'z', *'A'..'Z'].freeze
  
  validates :validate_full_url, presence: true

  def short_code
    id = ShortUrl.id
    code = "";
    while id > 0 do
      code += CHARACTERS[id%62]
      id = id/62
    end
    return code.reverse
  end
  
  def update_title!
  end

  def Short_code_to_id(param_short_code)
    id = 0
    i = 0
    while i < param_short_code.size do
      if 'a' <= param_short_code[i] && param_short_code[i] <= 'z'
          id = id * 62 + (param_short_code[i].ord - 'a'.ord) + 10
      end
      if 'A' <= param_short_code[i] && param_short_code[i] <= 'Z'
          id = id * 62 + param_short_code[i].ord - 'A'.ord + 36
      end
      if '0' <= param_short_code[i] && param_short_code[i] <= '9'
          id = id * 62 + param_short_code[i].ord - '0'.ord
      end
      i += 1
    end
    return id
  end 

 
  def find_by_short_code(param_short_code)
    ShortUrl.find_by(id: Short_code_to_id(param_short_code))
  end

  private
  def valid_url(full_url)
    uri = URI.parse(full_url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
    rescue URI::InvalidURIError
    false
  end
  
  def validate_full_url
    if !full_url.blank
      valid = valid_url(full_url)
      if !valid
        error.add(:full_url, message:"is not a valid url")
      end
    else
      error.add(:full_url, message:"can't be blank")
    end
  end


end
