#include Twilio
require 'docx'
namespace :parse do
	desc "This rake will parse the word_doc containing quotes"
	task :word_doc => :environment do

		Quote.delete_all
		QuoteHandler.delete_all

		# Create a Docx::Document object for our existing docx file
		doc = Docx::Document.open('quotes.docx')

		# Retrieve and display paragraphs
		i = 1
		doc.paragraphs.each do |p|
			begin
			i += 1
			puts "***************#{i}**************"
			  Quote.create(title: p.to_s.strip, published: true) if p.to_s.length > 0
			rescue Exception => ex
				puts "Exception : #{ex}"
			end
		end

	end
end