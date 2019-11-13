require 'pp'
require 'pry'

 def find_item_by_name_in_collection(name, collection)
  i = 0
  while i < collection.length do
    return collection[i] if name === collection[i][:item]
    i += 1
  end
  nil
end
 
 
 
 
 
 
def consolidate_cart(cart)
  output = {}
  cart.each do |item|
    item_name = item.keys[0]
    if output[item_name]
      output[item_name][:count] += 1 
    else
      output[item_name] = item[item_name]
      output[item_name][:count] = 1 
    
  end
  output
end

# if cart[index]item already exists (.unique?) add item 
# else push onto array


def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

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
