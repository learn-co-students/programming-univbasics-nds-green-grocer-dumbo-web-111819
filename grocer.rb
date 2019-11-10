def find_item_by_name_in_collection(name, collection)
  i=0
  result_array=[]
  new_hash={}
  while i<collection.length 
    if collection[i][:item]==name
      result_array << name
      new_hash=collection[i]
    end
    i+=1
  end
  if result_array.include?(name)
    new_hash
  else
    nil 
  end
  # Implement me first!
  #
  # Consult README for inputs and outputs
end
def unique_items(collection)
  new_array=[]
  collection.map do |element|
    new_array << element[:item]
  end
  new_array.uniq
end

def unique_hash(collections)
  i=0
  array_hash=[]
  unique_list=unique_items(collections)
  while i<unique_list.length do
    collections.map do |element|
      element[:count]={}
      if element[:item]==unique_list[i] && !array_hash.include?(element)
        array_hash << element
      end
    end
    i+=1
  end
  array_hash
end

def consolidate_cart(cart)
  i=0
  counting=[]
  counts=unique_items(cart)
  result_hash=unique_hash(cart)
  while i<counts.length do
    count=0
    cart.map do |element|
      if element[:item]==counts[i]
        count+=1
      end
    end
    counting << count
    result_hash[i][:count]=count
    i+=1
  end
  result_hash
end


#def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
#end

def apply_coupons(cart,coupons)
  new_array=cart
  cart.map do |item1|
    new_hash={}
    coupons.map do |item2|
      if item1[:item] == item2[:item]
        item1[:count]=item1[:count]-item2[:num]
        new="#{item1[:item]} W/COUPON"
        new_hash[:item]=new
        new_hash[:price]=item2[:cost]/item2[:num]
        new_hash[:clearance]=item1[:clearance]
        new_hash[:count]=item2[:num]
        new_array << new_hash
      end
    end
  end
  new_array
end


#def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
#end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
