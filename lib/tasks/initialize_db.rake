namespace :db do
  task :init => :environment do
    loader = CanvasQuestionLoader.new quiz_id: 36
    loader.process!
  end
end
