def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  index = 0
  while index < collection.length do
    if collection[index][:item] == name
      return collection[index]
    end
    index += 1
  end
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  consolidated_hash = {}
  index = 0
  while index < cart.length do
    food_name = cart[index][:item]
    if !consolidated_hash[food_name]
      cart[index][:count] = 1
      consolidated_hash[food_name] = cart[index]
    else
      consolidated_hash[food_name][:count] += 1
    end 
    index += 1
  end
  consolidated_hash.values
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart_index = 0
  while cart_index < cart.length do 
    item_info = cart[cart_index]
    index = 0
    while index < coupons.length do
      coupon = coupons[index]
      if coupon[:item] == item_info[:item] && coupon[:num] <= item_info[:count]
        # create a new hash w/coupon added to item name
        item_with_coupon = item_info.clone
        item_with_coupon[:item] = "#{item_with_coupon[:item]} W/COUPON"
        # also change the price and count of the new hash
        item_with_coupon[:price] = (coupon[:cost] / coupon[:num])
        item_with_coupon[:count] = coupon[:num]

        # reduce count of original item when there are leftovers
        item_info[:count] -= coupon[:num]

        # add coupon to the array
        cart << item_with_coupon
      end
      index += 1
    end
    cart_index += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  # REMEMBER: This method **should** update cart
  # array_with_clearance = []
  item_index = 0
  # create new array
  # look at the clearance value for each food item
  while item_index < cart.length do
    # clearance_value = cart[item_index][:clearance]
  # if clearance is true multiply by 0.8 to take off 20%
    if cart[item_index][:clearance]
      cart[item_index][:price] = (cart[item_index][:price] - cart[item_index][:price] * 0.20).round(2)
      # array_with_clearance[cart]
    end
    item_index +=1
  # change value of price to include discount
  # if clearance is false food item remains unchanged
  end
  cart
  # return new array with updated pricing
end

def checkout(cart, coupons)
 consolidated_cart = consolidate_cart(cart)
 couponed_cart = apply_coupons(consolidated_cart, coupons)
 final_cart = apply_clearance(couponed_cart)

 total = 0
 counter = 0
 while counter < final_cart.length do 
  total += final_cart[counter][:price] * final_cart[counter][:count]
  counter += 1
 end
 if total > 100
  total -= (total * 0.10)
 end 
 total 
end
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers