module ApplicationHelper
	def datebr(date)
		if date != nil
			date = date.strftime("%d/%m/%Y")
		end
	end

	def moneybr(money)
		if money != nil
		  money = number_to_currency money
		end
	end

	def wicked_image_active_storage_workaround( image )
	  if image.is_a? ActiveStorage::Attachment
	    save_path = Rails.root.join( "tmp", "#{image.id}.jpg")
	    File.open(save_path, 'wb') do |file|
	      file << image.blob.download
	    end
	    return save_path.to_s
	  end
	end
end
