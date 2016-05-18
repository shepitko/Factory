# Factory  
## Task  
Please implement your own class 'Factory' which will have the same behavior as 'Struct' class.  
  
## Solutions  
Class Struct:  
```
SuperHero = Struct.new(:name, :type, :skills, :city) do
  def greeting
    "Hello, I'm #{name}!"
  end
  
  def push_web
    "piu "*3
  end
end
 
spiderman = SuperHero.new("Peter Parker", "human-spider", "spyder's web", "New York City")
=> #<SuperHero:0x213eec8 @name="Peter Parker", @type="human-spider", @skills="spyder's web", @city="New York City">

a = spiderman #a is alias

a.name # => "Peter Parker"
a[:type] # => "human-spiderr"
a["skills"] # => "spyder's web"
a[3] # => "New York City"
a.greeting # => "Hello, I'm Peter Parker!"
a.push_web # => piu piu piu

```  
Class Factory([implementation](https://github.com/shepitko/Factory/blob/master/factory.rb)):  
```
SuperHero = Factory.new(:name, :type, :skills, :city) do
  def greeting
    "Hello, I'm #{name}!"
  end

  def push_web
    "piu "*3
  end
end

spiderman = SuperHero.new("Peter Parker", "human-spider", "spyder's web", "New York City")
=> #<SuperHero:0x213eec8 @name="Peter Parker", @type="human-spider", @skills="spyder's web", @city="New York City">

a = spiderman #a is alias

a.name # => "Peter Parker"
a[:type] # => "human-spiderr"
a["skills"] # => "spyder's web"
a[3] # => "New York City"
a.greeting # => "Hello, I'm Peter Parker!"
a.push_web # => piu piu piu

```  