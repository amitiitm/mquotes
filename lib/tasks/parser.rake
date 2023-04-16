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
				if p.to_s.length > 0
				  Quote.create(title: p.to_s.strip, published: true) 
				else
					puts '----------BLANK STRING-----------'
				end
			rescue Exception => ex
				puts "Exception : #{ex}"
			end
		end
		Quote.where(title: [nil, '']).delete_all
	end

	task :add_quotes => :environment do

		# Create a Docx::Document object for our existing docx file
		doc = Docx::Document.open('quotes_apr_2023.docx')
		# Retrieve and display paragraphs
		i = 1
		doc.paragraphs.each do |p|
			begin
				i += 1
				puts "***************#{i}**************"
				if p.to_s.length > 0
				  Quote.create(title: p.to_s.strip, published: true) 
				else
					puts '----------BLANK STRING-----------'
				end
			rescue Exception => ex
				puts "Exception : #{ex}"
			end
		end
		Quote.where(title: [nil, '']).delete_all
	end
end
