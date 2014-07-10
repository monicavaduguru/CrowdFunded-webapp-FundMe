class FundMeController < ApplicationController
  def main
    
  end
  def a
     puts params["Input"] 
  end
  
  def history
    begin
    @donations=Donation.where(user_id:current_user.id)
    kids=Kid.all
  @donations.each do |x|
      puts kids.find_by(id: x.kid_id).name
    end
    rescue
    end
  end
  
  def contact
    
  end
  def edu
     @kids=Kid.order(:name)
    puts @kids
    @kidsage=Kid.order("age")
    @kidsdate=Kid.order("created_at DESC")
    @kidsmoney=Kid.order("money_needed")
    @kidsdonationtime=Kid.order("donation_time DESC")
    @kidedu=[]
    @kids.each do |kid|
      if(kid.purpose=="Education")
         @kidedu<<kid
      end
    end
  end
   
  def rec
    
    @kids=Kid.order(:name)
    puts @kids
    @kidsage=Kid.order("age")
    @kidsdate=Kid.order("created_at DESC")
    @kidsmoney=Kid.order("money_needed")
    @kidsdonationtime=Kid.order("donation_time DESC")
   
  end
  def map
    
  end
end
