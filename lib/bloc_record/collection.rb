 module BlocRecord
   class Collection < Array
    
     # #5
     def update_all(updates)
       ids = self.map(&:id)
       # #6
       self.any? ? self.first.class.update(ids, updates) : false
     end
    def destroy_all
      if self.length > 0
        self.each do |ele|
          ele.destroy
        end
      else
        puts "nothing exsits to destory ."
      end
    end
   end
 end