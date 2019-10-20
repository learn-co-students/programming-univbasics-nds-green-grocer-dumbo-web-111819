require 'pry'

def find_item_by_name_in_collection(name, collection)
 i = 0 
 while i < collection.count do 
   if collection[i][:item] == name 
     return collection[i]
   else 
     i +=1 
   end
 end
 if i == collection.count 
   puts nil 
 end
end

def consolidate_cart(cart)
  unique_array= []
  i = 0 
  while i < cart.count do 
    
    if unique_array.include?(cart[i])
      array_index = unique_array.index(cart[i])
      unique_array[array_index][:count] += 1 
    else 
      cart[i][:count] = 1
      unique_array << cart[i]
    end
    i += 1 
    
  end 
  unique_array
end

def apply_coupons(cart, coupons)
new_array = []
i = 0

while i < cart.count do
  y = 0
  while y < coupons.count do 
    if coupons[y][:item] == cart[i][:item] && coupons[y][:num] <= cart[i][:count]
      new_hash = {}
      new_hash[:item] = cart[i][:item] + " W/COUPON"
      new_hash[:price] = coupons[y][:cost] / coupons[y][:num]
      new_hash[:clearance] = cart[i][:clearance]
      new_hash[:count] = coupons[y][:num]
      cart[i][:count] = cart[i][:count] - coupons[y][:num]
      
      cart << new_hash
    else 
      
      y += 1
    end
  end
i += 1
end
cart
  
end

def apply_clearance(cart)
  
  i = 0 
  while i < cart.count do
    if cart[i][:clearance] == true 
      clearance_price = (cart[i][:price] *0.8).round(2)
      cart[i][:price] = clearance_price
    end
    i += 1 
  end
  cart
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
  
  cart = consolidate_cart(cart)
  
  cart = apply_coupons(cart,coupons)
  
  cart = apply_clearance(cart)
  
  i = 0 
  total= 0 
  grand_total = 0 
  while i < cart.count do
    total += cart[i][:price] * cart[i][:count]
    i += 1
  end
  if total > 100 
    grand_total = total *(0.9)
    
 
  else
    grand_total = total
  end
  grand_total

end
