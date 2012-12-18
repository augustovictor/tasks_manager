module ApplicationHelper

  def name_abbreviation(name)
    arr = name.split(' ')
    short_name = ''

    arr.each do |word|
      short_name << word[0]
    end

    short_name.upcase
  end

end
