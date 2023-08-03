require "test_helper"
require Rails.root.join("lib/scraping.rb") 

class KindleTest < ActiveSupport::TestCase
   test "電子->紙ASIN変換" do
      scrapingObj = AmazonScraping.new()
      id = scrapingObj.searchPaperAsin("B0C6993WBQ")
      assert id == "4088836448"
   end

   test "紙->紙ASIN変換" do
      scrapingObj = AmazonScraping.new()
      id = scrapingObj.searchPaperAsin("4088836448")
      assert id == "4088836448"
   end

   test "紙ASINが存在しないケース(電子書籍のみ)" do
      scrapingObj = AmazonScraping.new()
      id = scrapingObj.searchPaperAsin("B0BRMKV148")
      assert id == nil
   end
   
   test "そもそも書籍ASINではないケース(お茶のASIN)" do
      scrapingObj = AmazonScraping.new()
      id = scrapingObj.searchPaperAsin("B00IRVRZWA")
      assert id == nil
   end
   test "存在しないASIN" do 
      scrapingObj = AmazonScraping.new()
      id = scrapingObj.searchPaperAsin("B0cript>11")
      assert id == nil
   end
end