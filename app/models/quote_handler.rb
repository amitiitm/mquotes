class QuoteHandler < ApplicationRecord

	def self.generate_uniq_quote
		quote_ids = QuoteHandler.first.present? ? QuoteHandler.first.quote_ids : '[0]'
		quote_ids = eval(quote_ids)
		q = Quote.where('id NOT IN (?)', quote_ids).order("RANDOM()").limit(1).first
		if q.present?
			update_quote_handler(quote_ids << q.id)
		else
			update_quote_handler([0])
			q = Quote.order("RANDOM()").limit(1)
		end
		q.title
	end

	def self.update_quote_handler(quote_ids)
		qh = QuoteHandler.first
		if qh.present?
			qh.update_attributes(quote_ids: quote_ids)
		else
			QuoteHandler.create(quote_ids: quote_ids)
		end
	end

end
