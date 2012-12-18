module TasksHelper

  def priority_style(priority_task)
    return 'priority_one' if priority_task == 1
    return 'priority_two' if priority_task == 2
    return 'priority_three' if priority_task == 3
  end

end
