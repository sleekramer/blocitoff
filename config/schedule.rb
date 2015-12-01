set :environment, "development"
every 1.minute do
  rake "todo:delete_items"
end
