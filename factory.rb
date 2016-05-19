class Factory

  def self.new( *arg, &block )
    Class.new do
      @@args = arg
      attr_accessor(*arg)
      define_method :initialize do |*arg_val|
        arg_val.each_with_index { |v, k| send("#{arg[k]}=", "#{v}") }
      end

      def [](index)
        case index
        when String, Symbol then send("#{index}")
        when Integer then send(@@args[index])
        end
      end

      class_eval(&block)
    end
  end
  
end

