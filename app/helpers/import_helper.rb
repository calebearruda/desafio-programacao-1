require 'pathname'

module ImportHelper
  
  def do_import originFile
    begin 
      path = Pathname.new(Rails.root.join('public', 'uploads', originFile.original_filename))
      
      unless path.extname == ".tab" || path.extname == ".txt"
        raise "Sorry, the file is not correct. We accept just file's .tab or .txt"
      end
      
      if File.exists?(Rails.root.join('public', 'uploads', originFile.original_filename))
        raise "Sorry, the file has already been imported!"
      end
      
      File.open(Rails.root.join('public', 'uploads', originFile.original_filename), 'wb') do |file|
        file.write(originFile.read)
      end
      
      create_data originFile.original_filename
      
      flash.clear
      redirect_to root_path
    rescue Exception => e  
      flash[:error] = e.message
      redirect_to root_path
    end
  end
  
  
  def create_data fileName
    File.readlines(Rails.root.join('public', 'uploads', fileName)).drop(1).each do |line|
      s = line.split(/\t/)
      
      ActiveRecord::Base.transaction do
        purchaser = Purchaser.find_by_name(s[0])
        unless purchaser
          purchaser = Purchaser.new
          purchaser.name = s[0]
          purchaser.save
        end
        
        merchant = Merchant.find_by_name(s[5])
        unless merchant
          merchant = Merchant.new
          merchant.name = s[5]
          merchant.adress = s[4]
          merchant.save
        end
      
        item = Item.find_by_description(s[1])
        unless item
          item = Item.new
          item.description = s[1]
          item.price = s[2]
          item.save
        end
        
        purchase = Purchase.new
        purchase.count_sale = s[3]
        purchase.item = item
        purchase.merchant = merchant
        purchase.purchaser = purchaser
        purchase.save
      end
      
    end
  end
  
end