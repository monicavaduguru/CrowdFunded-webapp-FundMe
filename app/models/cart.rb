class Cart < ActiveRecord::Base
  has_many :line_items,dependent: :destroy
  def add_kid(kid_id,value)
    current_item = line_items.find_by(kid_id: kid_id)
    #current_kid=Kid.find_by(id: kid_id)
    if current_item
      current_item.amount += value.to_i
      #current_kid.money_received+=value.to_i
    else
      current_item = line_items.build(kid_id: kid_id)
      current_item.amount += value.to_i
      #current_kid.money_received+=value.to_i

    end
    #current_kid.save
    current_item
  end
  
  def add_history(user_id)
   puts "here 1"

    li=line_items.all

    li.each do |present|
      donation=Donation.new(kid_id: present.kid_id,user_id: user_id,amount: present.amount)
      puts donation
      donation.save
    
    end
  end
  
  
  def paypal_url(return_url,notify_url)
    puts "here"
    puts id
  values = {
    :business => 'ryanzyx@gmail.com',
    :cmd => '_cart',
    :upload => 1,
    :return => return_url,
    :invoice => id,
    :notify_url => notify_url
  }
  line_items.each_with_index do |item, index|
    values.merge!({
      "amount_#{index+1}" => item.amount,
      "item_name_#{index+1}" => item.kid.name,
      "item_number_#{index+1}" => item.kid.id,
    })
  end
  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
end

  def add_donation()
    #current_item = line_items.find_by(kid_id: kid_id)
    puts "here"
    li=line_items.all
    li.each do |present|
      current_kid=Kid.find_by(id: present.kid_id) 
      current_kid.money_received=current_kid.money_received+present.amount
      current_kid.money_needed=current_kid.money_required-current_kid.money_received
      current_kid.donation_time=DateTime.now
      puts current_kid
      puts "here2"
      current_kid.save
    #current_item
    end
  end

end
