class SqlFile < ActiveRecord::Migration[6.0]
  def change
    sql = File.read(File.expand_path('../../demo.sql', __FILE__))
    statements = sql.split(/;$/)
    statements.pop # remove empty line
    ActiveRecord::Base.transaction do
      statements.each do |statement|
        connection.execute(statement)
      end
    end  
  end
end
