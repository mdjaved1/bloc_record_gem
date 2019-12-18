 module BlocRecord
   class Collection < Array
    
   def take(num=1)
      self[0..num-1]
    end

    def where(data)
      r = []
      for item in self
        for key in data.keys
          r += self.first.class.where("id" => item.id, key => data[key])
        end
      end
      r
    end

    def not(data)
      r = []
      for item in self
        for key in data.keys
          r += self.first.class.where("id" => item.id, key => !data[key])
        end
      end
      r
    end
    
     def update_all(updates)
       ids = self.map(&:id)
       # #6
       self.any? ? self.first.class.update(ids, updates) : false
     end
   end
 end