class Animal

	attr_accessor:name
	attr_accessor:position
	attr_accessor:direction
	def initialize(name,position,direction)
		@name=name
                @position=position
                @direction=direction

	end
	def crawl
		if @direction == 'N' and @position[2] < 9
			@position[2] += 1
			puts("New Position is #{@name} #{@position} #{@direction}")
		
		elsif @direction == 'S' and @position[2] > 0
			@position[2] -= 1
			puts("New Position is #{@name} #{@position} #{@direction}")
		
		elsif @direction == 'E' and @position[0] < 9
			@position[0] += 1
			puts("new Position is #{@name} #{@position} #{@direction}")
		
		elsif @direction == 'W' and @position[0] > 0
			@position[0] -= 1
			puts("New Position is #{@name} #{@position} #{@direction}")
		
		else 
			@direction=self.turn
		
		end
	
	end

	
	def jump
		if @direction == 'N' and @position[2] < 8
			@position[2] += 2
			puts("New Position #{@name} #{@position} #{@direction}")
		
		elsif @direction == 'S' and @position[2] > 1
                        @position[2] -= 2
                        puts("New Position #{@name} #{@position} #{@direction}")
		
		elsif @direction == 'E' and @position[0] < 8
                        @position[0] += 2
                        puts("New Position #{@name} #{@position} #{@direction}")
		
		elsif @direction == 'W' and @position[0] > 1
                        @position[0] -= 2
                        puts("New Position #{@name} #{@position} #{@direction}")

		else
			@direction=self.turn
		end
	end

	
	def turn
		if @direction == 'N'
			seq=['S','E','W']
			return seq[rand(seq.length)]
			
		
		elsif @direction == 'S'
                        seq=['N','E','W']
                        return  seq[rand(seq.length)]
			
		
		elsif @direction == 'E'
                        seq=['S','N','W']
                        return seq[rand(seq.length)]
			
		
		else 
                        seq=['S','E','N']
                        return seq[rand(seq.length)]
			
		end

	end
	def eat(objArray,prey)
		puts("#{prey.name} get eaten")
	end
end

class Worm < Animal
	def initialize(name,position,direction)
		super(name,position,direction)
		puts("Worm Created #{@name} #{@position} #{@direction}")
	end

	def move
		self.class.superclass.instance_method(:crawl).bind(self).call
	end
end 


class Ghopper < Animal
	def initialize(name,position,direction)
		super(name,position,direction)
                puts("GrassHopper Created #{@name} #{@position} #{@direction}")
	end
	def move
		self.class.superclass.instance_method(:jump).bind(self).call
	end
	def eat(objArray,prey)
		self.class.superclass.instance_method(:eat).bind(self).call(objArray,prey)
	end
end


class Snake < Animal
	def initialize(name,position,direction)
		super(name,position,direction)
		puts("Snake Created #{@name} #{@position} #{@direction}")
	end

	def move
	self.class.superclass.instance_method(:crawl).bind(self).call
	end
	
	def eat(objArray,prey)
                self.class.superclass.instance_method(:eat).bind(self).call(objArray,prey)
        end

end

class Frog < Animal
        def initialize(name,position,direction)
                super(name,position,direction)
                puts("Frog Created #{@name} #{@position} #{@direction}")
        end

        def move
        self.class.superclass.instance_method(:jump).bind(self).call
        end

	def eat(objArray,prey)
                self.class.superclass.instance_method(:eat).bind(self).call(objArray,prey)
        end

end


class Bfrog < Frog 
        def initialize(name,position,direction)
                super(name,position,direction)
        end

        def move
        self.class.superclass.instance_method(:move).bind(self).call
        end

	def eat(objArray,prey)
                self.class.superclass.instance_method(:eat).bind(self).call(objArray,prey)
        end

end

 
w1=Worm.new('W',[1,'-',2],'E')
g1=Ghopper.new('GH',[4,'-',3],'N')
s1=Snake.new('S',[4,'-',6],'S')
f1=Frog.new('F',[3,'-',4],'S')
bf1=Bfrog.new('BF',[2,'-',4],'E')
objArray=[w1,g1,s1,f1,bf1]
while objArray.length > 1
	puts("===================================")
	posArray=[]
	 @rmv_obja
         @rmv_obja1
         @rmv_objb
         @rmv_objb1
         @rmv_objc
         @rmv_objc1
         @rmv_objd
         @rmv_objd1

	for obj in (0..objArray.length-1)
		
		sleep(1)
		objArray[obj].move
		if posArray.length == 0
			posArray.push(objArray[obj],objArray[obj].position)
	
		else
			posArray.push(objArray[obj],objArray[obj].position)
			for i in (0..posArray.length-3)
				
				if posArray[i] == objArray[obj].position
				        
					name1=posArray[i-1].name
					name2=objArray[obj].name
					puts("======#{name1} meets #{name2}======")
					if name1 == 'GH' and name2 == 'W'
						@rmv_obja = objArray[obj]
						posArray[i-2].eat(objArray,objArray[obj])
						posArray.delete(objArray[obj].position)
						posArray.delete(objArray[obj])
						break
					
					elsif name1 == 'W' and name2== 'GH'
						@rmv_obja1 = posArray[i-1]
						objArray[obj].eat(objArray,posArray[i-1])
						posArray.delete(posArray[i-1])
						posArray.delete(posArray[i-1])
						break
					
					elsif name1 == 'F' and name2 == 'GH'
						@rmv_objb = objArray[obj]
                                                posArray[i-1].eat(objArray,objArray[obj])
                                                posArray.delete(objArray[obj].position)
                                                posArray.delete(objArray[obj])
                                                break

					elsif name1 == 'GH' and name2 == 'F'
						@rmv_objb1 = posArray[i-1]
                                                objArray[obj].eat(objArray,posArray[i-1])
                                                posArray.delete(posArray[i-1])
                                                posArray.delete(posArray[i-1])
                                                break
					
					elsif name1 == 'S' and (name2 == 'GH' or name2 == 'F')
						@rmv_objc = objArray[obj]
                                                posArray[i-1].eat(objArray,objArray[obj])
                                                posArray.delete(objArray[obj].position)
                                                posArray.delete(objArray[obj])
                                                break
					
					elsif (name1 == 'GH' or name1 == 'F') and name2 == 'S'
						@rmv_objc1 = posArray[i-1]
                                                objArray[obj].eat(objArray,posArray[i-1])
                                                posArray.delete(posArray[i-1])
                                                posArray.delete(posArray[i-1])
                                                break
						
					elsif name1 == 'BF' and (name2 == 'F' or name2 == 'S')
						@rmv_objd = objArray[obj]
                                                posArray[i-1].eat(objArray,objArray[obj])
                                                posArray.delete(objArray[obj].position)
                                                posArray.delete(objArray[obj])
                                                break
						
					elsif (name1 == 'F' or name2 == 'S') and name2 == 'BF'
						@rmv_objd1 = posArray[i-1]
                                                objArray[obj].eat(objArray,posArray[i-1])
                                                posArray.delete(posArray[i-1])
                                                posArray.delete(posArray[i-1])
                                                break
 

												
						
					end
				end
			end
		end
		
	end
	if @rmv_obja:
		objArray.delete(@rmv_obja)
	end
	if @rmv_obja1:
		objArray.delete(@rmv_obja1)
	end
	if @rmv_objb:
		objArray.delete(@rmv_objb)
	end
	if @rmv_objb1:
		objArray.delete(@rmv_objb1)
	end
	if @rmv_objc:
		objArray.delete(@rmv_objc)
	end
	if @rmv_objc1:
		objArray.delete(@rmv_objc1)
	end
	if @rmv_objd:
		objArray.delete(@rmv_objd)
	end
	if @rmv_objd1:
		objArray.delete(@rmv_objd1)
	end
end
