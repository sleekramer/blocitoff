namespace :todo do
  desc "Delete items that are more than seven days old"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
