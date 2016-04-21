class Factory

  def self.new( *arg, &block )
    Class.new do
      @@arg = arg
      arg.each { |arg| attr_accessor arg }
      define_method :initialize do |*arg_val|
        arg_val.each_with_index { |v, k| send("#{arg[k]}=", "#{v}") }
      end

      def [](index)
        case index
        when String, Symbol then send("#{index}")
        when Integer then send(@@arg[index])
        end
      end

      class_eval(&block)
    end
  end
  
end

SuperHero = Factory.new(:name, :type, :skills, :city) do
  def greeting
    "Hello, I'm #{name}!"
  end

  def push_web
    "piu "*3
  end
end

spiderman = SuperHero.new("Peter Parker", "human-spider", "spyder's web", "New York City")
a = spiderman #a is alias?
puts a.name, a[:type], a["skills"], a[3], a.greeting, a.push_web