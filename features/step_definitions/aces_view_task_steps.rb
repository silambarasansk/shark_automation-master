INITIAL_XPATH="//ul[@class='task-navigtaion']/li[1]"
TASKS_XPATH="//ul[@class='tasks']/li[*]"
INITIAL_LABEL_XPATH="//ul[@class='task-navigtaion']/li[1]/span[1]"
INITIAL_VALUE_XPATH="//ul[@class='task-navigtaion']/li[1]/span[2]"
IN_PROGRESS_LABEL_XPATH="//ul[@class='task-navigtaion']/li[2]/span[1]"
IN_PROGRESS_VALUE_XPATH="//ul[@class='task-navigtaion']/li[2]/span[2]"
FINAL_LABEL_XPATH="//ul[@class='task-navigtaion']/li[3]/span[1]"
FINAL_VALUE_XPATH="//ul[@class='task-navigtaion']/li[3]/span[2]"
COMPLETED_LABEL_XPATH="//ul[@class='task-navigtaion']/li[4]/span[1]"
COMPLETED_VALUE_XPATH="//ul[@class='task-navigtaion']/li[4]/span[2]"
SELECTED_TASK_BKT_XPATH="//li[@class='item selected']/span[1]"


Then(/^I should see "([^"]*)", "([^"]*)", "([^"]*)" and "([^"]*)" task buckets with appropriate tasks count$/) do |initial, in_progress, final, completed|
  if(@session.find(:xpath,INITIAL_LABEL_XPATH).text.include? initial)
    @initial_bkt_count = @session.find(:xpath,INITIAL_VALUE_XPATH).text
    puts "INITIAL REVIEW bucket is present and it tasks count is: #{@initial_bkt_count} \n"
  else
    puts "INITIAL REVIEW bucket is not present \n"
  end
  if(@session.find(:xpath,IN_PROGRESS_LABEL_XPATH).text.include? in_progress)
    @in_prog_bkt_count = @session.find(:xpath,IN_PROGRESS_VALUE_XPATH).text
    puts "IN PROGRESS REVIEW bucket is present and it tasks count is: #{@in_prog_bkt_count} \n"
  else
    puts "IN PROGRESS REVIEW bucket is not present \n"
  end
  if(@session.find(:xpath,FINAL_LABEL_XPATH).text.include? final)
    @final_bkt_count = @session.find(:xpath,FINAL_VALUE_XPATH).text
    puts "FINAL REVIEW bucket is present and it tasks count is: #{@final_bkt_count} \n"
  else
    puts "FINAL REVIEW bucket is not present \n"
  end
  if(@session.find(:xpath,COMPLETED_LABEL_XPATH).text.include? completed)
    @comp_bkt_count = @session.find(:xpath,COMPLETED_VALUE_XPATH).text
    puts "COMPLETED REVIEW bucket is present and it tasks count is: #{@comp_bkt_count} \n"
  else
    puts "COMPLETED REVIEW bucket is not present \n"
  end
end
Then(/^by default INITIAL REVIEW bucket should be selected$/) do
  text = @session.find(:xpath,SELECTED_TASK_BKT_XPATH).text
  if(text == "INITIAL REVIEW")
      puts "Initial review bucket is seleceted by default"
  else
    puts "Initial review bucket is not seleceted by default"
  end
end
# Then(/^I should see tasks available in INITIAL REVIEW bucket based on task count$/) do
#   count = @session.all(:xpath,TASKS_XPATH).size
#   puts  "#{count} \n"
#   puts "#{@initial_tasks_count  } \n"
#   if(count.to_i == @initial_tasks_count.to_i)
#       puts "initial tasks count is balanced"
#     else
#       puts "not balanced"
#     end
# end

When(/^I click COMPLETED bucket$/) do
  @session.find(:xpath,COMPLETED_LABEL_XPATH).click
end

Then(/^I should see applicable tasks in COMPLETED bucket and task count should match available tasks$/) do
  text = @session.find(:xpath,SELECTED_TASK_BKT_XPATH).text
  @tasks_count = @session.all(:xpath,TASKS_XPATH).size
  @comp_bkt_count = @session.find(:xpath,COMPLETED_VALUE_XPATH).text
  if(text == "COMPLETED")
      puts "Completed bucket is seleceted and available task count is #{@tasks_count} \n"
      if(@comp_bkt_count.to_i == @tasks_count.to_i)
        puts "Completed Bucket total task count is equal to available task count \n"
      else
        puts "Completed Bucket total task count is not equal to available task count \n"
      end
  else
    puts "Completed bucket is not seleceted \n"
  end
end

When(/^I click FINAL REVIEW bucket$/) do
  @session.find(:xpath,FINAL_LABEL_XPATH).click
end

Then(/^I should see applicable tasks in FINAL REVIEW bucket and task count should match available tasks$/) do
  text = @session.find(:xpath,SELECTED_TASK_BKT_XPATH).text
  @tasks_count = @session.all(:xpath,TASKS_XPATH).size
  @final_bkt_count = @session.find(:xpath,FINAL_VALUE_XPATH).text
  if(text == "FINAL REVIEW")
      puts "Final review bucket is seleceted and available task count is #{@tasks_count} \n"
      if(@final_bkt_count.to_i == @tasks_count.to_i)
        puts "Final review Bucket total task count is equal to available task count \n"
      else
        puts "Final review Bucket total task count is not equal to available task count \n"
      end
  else
    puts "Final review bucket is not seleceted \n"
  end
end

When(/^I click IN PROGRESS bucket$/) do
  @session.find(:xpath,IN_PROGRESS_LABEL_XPATH).click
end

Then(/^I should see applicable tasks in IN PROGRESS bucket and task count should match available tasks$/) do
  text = @session.find(:xpath,SELECTED_TASK_BKT_XPATH).text
  @tasks_count = @session.all(:xpath,TASKS_XPATH).size
  @in_prog_bkt_count = @session.find(:xpath,IN_PROGRESS_VALUE_XPATH).text
  if(text == "IN PROGRESS")
      puts "In progress bucket is seleceted and available task count is #{@tasks_count} \n"
      if(@in_prog_bkt_count.to_i == @tasks_count.to_i)
        puts "In progress Bucket total task count is equal to available task count \n"
      else
        puts "In progress Bucket total task count is not equal to available task count \n"
      end
  else
    puts "In progress bucket is not seleceted \n"
  end
end

When(/^I click INITIAL REVIEW bucket$/) do
  @session.find(:xpath,INITIAL_LABEL_XPATH).click
end

Then(/^I should see applicable tasks in INITIAL REVIEW bucket and task count should match available tasks$/) do
  text = @session.find(:xpath,SELECTED_TASK_BKT_XPATH).text
  @tasks_count = @session.all(:xpath,TASKS_XPATH).size
  @initial_bkt_count = @session.find(:xpath,INITIAL_VALUE_XPATH).text
  if(text == "INITIAL REVIEW")
      puts "Initial review bucket is seleceted and available task count is #{@tasks_count} \n"
      if(@initial_bkt_count.to_i == @tasks_count.to_i)
        puts "Initial review Bucket total task count is equal to available task count \n"
      else
        puts "Initial review Bucket total task count is not equal to available task count \n"
      end
  else
    puts "Initial review bucket is not seleceted \n"
  end
end


    # puts @session.find(:xpath,".//ul[@class='task-navigtaion']/li[3]").click
    # count = @session.all(:xpath,".//ul[@class='tasks']/li[*]").size
    # puts count
  #   within(:xpath,"//ul[@class='tasks']") do
  #   count=@session.all(:xpath,"//ul[@class='tasks']",:visible => true)
  #   puts count.size
  # end
  #   within('.task-navigtaion') do
  #   @session.all(:css, '.label').each do |element|
  #   puts "#{element.text} \n"
  #   end
  #   @session.all(:css, '.badge').each do |element|
  #   puts "#{element.text} \n"
  #   end
  #   end
