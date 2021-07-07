def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  # Consult README for inputs and outputs
  
  output = nil
  i = 0
  
  while i < collection.length do
    if collection[i][:item] != name
      i += 1
    else 
      output = collection[i]
      i = collection.length
    end
  end
  output
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
  #create outcart first hash
  outcart = []
  outcart << cart[0]
  outcart[0][:count] = 0
  
  #fill in rest of outcart but with all counts 0
  i = 0
  need_to_add = false
  while i < cart.length do
    k = 0
    while k < outcart.length do
      if outcart[k][:item] == cart[i][:item]
        need_to_add = false
        k = outcart.length
      else
        need_to_add = true
        k += 1
      end
    end
    if need_to_add
      transfer = cart[i]
      transfer[:count] = 0
      outcart << transfer
    end
    i += 1
  end
  
  x = 0
  while x < cart.length do
    y = 0
    while y < outcart.length do
      if cart[x][:item] == outcart[y][:item]
        outcart[y][:count] += 1
      end
      y += 1
    end
    x += 1
  end
  outcart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  i = 0
  while i < coupons.length do
    k = 0
    while k < cart.length do
      if coupons[i][:item] == cart[k][:item] && coupons[i][:item] >= cart[k][:item]
        cart << {:item => "#{coupons[i][:item]} W/COUPON", :price => (coupons[i][:cost]/coupons[i][:num]), :clearance => cart[k][:clearance], :count => (cart[k][:count] - (cart[k][:count]) % (coupons[i][:num]))}
        cart[k][:count] = (cart[k][:count]) % (coupons[i][:num])
      end
      if cart[k][:count] == 0
        cart.delete(i)
      end
      k += 1
    end
    i += 1      
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  i = 0
  while i < cart.length do
    if cart[i][:clearance]
      cart[i][:price] *= 0.8
      cart[i][:price].round(2)
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
  
  cart_two = consolidate_cart(cart)
  cart_three = apply_coupons(cart_two, coupons)
  cart_final = apply_clearance(cart_three)
  
  i = 0
  total = 0
  
  while i < cart_final.length do
    k = 0
    while k < cart_final[i][:count] do
      total += cart_final[i][:price]
      k += 1
    end
    i += 1
  end
  if total > 100
    total *= 0.9
  end
  total.round(2)
end
