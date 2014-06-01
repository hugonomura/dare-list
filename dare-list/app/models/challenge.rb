require 'date'
require 'csv' 

class Challenge < ActiveRecord::Base


  has_many :users , through: :users_challenges
  has_many :users_challenges


  def self.read_csv(csv_file)
    CSV.foreach(csv_file, {:headers => false,:col_sep => ";"}) do |row|
      name = row[0]
      type = row[1]

      unless type == "true"
        type = false
      else
        type = true
      end
      
      description = row[2]
      date = row[3]
      date = Date.parse( date.gsub(/, */, '-') )

      unless name.nil? || type.nil? || description.nil? || date.nil?
        Challenge.create(name: name,type: type,description: description,date: date)
      end

      end
  end

end
