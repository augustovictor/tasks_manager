module ApplicationHelper

  def break_lines(text)
    text.gsub(/\n/, '<br>').html_safe
  end

  def highlight_current_menu(menu)

  end

  def name_abbreviation(name)
    arr = name.split(' ')
    short_name = ''

    arr.each do |word|
      short_name << word[0]
    end

    short_name.upcase
  end

  def presenting_name(name)
    name = name.split(' ')
    short_name = []
    short_name  << name[0]
    short_name  << name[1]
    short_name.join(' ')
  end

  def time_remaining(task)
    now = Time.zone.now
    time_remaining = distance_of_time_in_words(now, task.deadline)
  end

  def delayed_task_style(task)
    now = Time.zone.now
    if now - task.deadline >= 0 && task.done == false
      'badge badge-important'
    else
      'badge badge-info'
    end
  end

  def time_remaining_or_delayed_text(task)
    now = Time.zone.now
    if now - task.deadline <= 0
      'Time remaining:'
    else
      'Delayed:'
    end
  end

end
