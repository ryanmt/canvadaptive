namespace :db do
  task :init => :environment do
    loader = CanvasQuestionLoader.new quiz_id: 24
    loader.process!
  end
end
