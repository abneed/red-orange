class StoredProcedureService

  def self.select(class_type, name, *args)
    results = []
    begin
      connection.execute("SELECT * FROM #{name}(#{args.join(',')})").each do |row|
        results << class_type.new(Hash[row])
      end
    ensure
      connection.close
    end
    results.length > 1 ? results : results.first
  end

  def self.execute(class_type, name, args)
    results = []
    for i in 0..args.length - 1 do
      args[i] = args[i].is_a?(String) ? "\'#{args[i]}\'" : args[i]
    end
    begin
      connection.execute("CALL #{name}(#{args.join(',')})").each do |row|
        results << class_type.new(Hash[row])
      end
    ensure
      connection.close
    end
    results.length > 1 ? results : results.first
  end

  def self.select_for_graph(name, *args)
    results = []
    begin
      connection.execute("SELECT * FROM #{name}(#{args.join(',')})").each do |row|
        results << Hash[row]
        
      end
    ensure
      connection.close
    end
    results
  end

  private
    def self.connection
      ActiveRecord::Base.connection
    end
end