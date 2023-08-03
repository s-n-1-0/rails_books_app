class AmazonScraping
    def searchPaperAsin(kindle_asin)
      paper_asin = nil
      agent = Mechanize.new
      begin #NOTE: 404時強制終了されないけど503エラーに気づけない...
         page = agent.get("https://www.amazon.co.jp/dp/"+kindle_asin)
      rescue
         return paper_asin
      end
      ellist = page.search("#tmmSwatches")
      if ellist.length > 0 then
         alist = ellist[0].search("a")
         asin_list = alist.map{|el|
            ret_id = nil
            url = el.attributes["href"].value
            split_url = url.split("/")
            dp_index = split_url.index("dp")
            if !dp_index.nil? && (dp_index + 1) < split_url.length then
               ret_id = split_url[dp_index + 1]
            end
            ret_id
            }.select{|id| !id.nil?}
         if asin_list.length > 0 then
            paper_asin = asin_list[0]
         end

         if kindle_asin == paper_asin then
            paper_asin = nil
         end
         #ソースのasinを変換したらB0から始まる場合、
         #kindle_asinがB0から始まらないなら -> 紙の本
         #始まるなら -> 変換できていない(変換先がない)
         if !paper_asin.nil?
            if paper_asin.start_with?("B0") then
               paper_asin = kindle_asin
            end
         end
      end
      return paper_asin
    end
 end