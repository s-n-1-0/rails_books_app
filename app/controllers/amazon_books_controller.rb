require Rails.root.join("lib/scraping.rb") 
class AmazonBooksController < ApplicationController
  def convert
    isvalid = true
    asin = params["asin"]
    #param valid チェック
    if !(!asin.nil? &&
       asin.is_a?(String) &&
       asin.length == 10 &&
       asin.start_with?("B0")) then
      render status: 400, json:{error:400}
      return
    end
    kindle = Kindle.find_by(kindle_asin:asin)
    if kindle then 
      paper_asin = kindle.paper_asin
    else  #存在しないならスクレイピングで取得
      scrapingObj = AmazonScraping.new()
      res_asin = scrapingObj.searchPaperAsin(asin)
      if !res_asin.nil? && asin != res_asin && !res_asin.start_with?("B0") then
        kindle = Kindle.new({kindle_asin:asin,paper_asin:res_asin})
        kindle.save
        paper_asin = res_asin
      end 
    end
    render json:{kindle_asin:asin,paper_asin:paper_asin}
  end
end
