
require 'net/http'
require 'rubygems'
require 'xmlsimple'
require 'uri'
require 'json'


class AlchemyAPI_Params
  attr_accessor :url
  attr_accessor :html
  attr_accessor :text

  class OutputMode
    XML = "xml";
    JSON = "json";
    RDF = "rdf";
  end

  def initialize()
    @url = ""
    @html = ""
    @text = ""
    @outputMode = OutputMode::XML
    @customParameters = ""
  end

  def getUrl()
    return @url
  end

  def setUrl(url)
    @url = url
  end

  def getHtml()
    return @html
  end

  def setHtml(html)
    @html = html.to_s
  end

  def getText()
    return @text
  end

  def setText(text)
    @text = text
  end

  def getOutputMode()
    return @outputMode
  end

  def setOutputMode(mode)
    if (mode != OutputMode::XML && mode != OutputMode::JSON && mode != OutputMode::RDF)
       raise "Error setting output mode."
    end
    @outputMode = mode
  end

  def getCustomParameters()
    return @customParameters
  end

  def setCustomParameters(*args)
    @customParameters = ""
    i = 0
    while (i < args.length) do
      @customParameters += "&" + args.at(i)
      i += 1
      @customParameters += "=" + URI.escape(args.at(i))
      i += 1
    end
  end

  def getParameterString()
    retString = ""
    if (@url != "")
      retString += "&url=" + URI.escape(@url)
    end
    if (@html != "")
      retString += "&html=" + URI.escape(@html)
    end
    if (@text != "")
      retString += "&text=" + URI.escape(@text)
    end
    if (@outputMode != "")
      retString += "&outputMode=" + URI.escape(@outputMode)
    end
    if (@customParameters != "")
      retString += @customParameters
    end
    return retString
  end
end


class AlchemyAPI_NamedEntityParams < AlchemyAPI_Params
  attr_accessor :sourceText
  attr_accessor :maxRetrieve
  attr_accessor :baseUrl
  attr_accessor :cQuery
  attr_accessor :xPath

  def initialize()
    super()
    @disambiguate = ""
    @linkedData = ""
    @coreference = ""
    @quotations = ""
    @sourceText = ""
    @showSourceText = ""
    @sentiment = ""
    @maxRetrieve = ""
    @baseUrl = ""
    @cQuery = ""
    @xPath = ""
  end

  def getDisambiguate()
    return @disambiguate
  end

  def setDisambiguate(setting)
    if (setting != 1 && setting != 0)
       raise "Error setting Disambiguate."
    end
    @disambiguate = setting
  end

  def getLinkedData()
    return @linkedData
  end

  def setLinkedData(setting)
    if (setting != 1 && setting != 0)
       raise "Error setting LinkedData."
    end
    @linkedData = setting
  end

  def getCoreference()
    return @coreference
  end

  def setCoreference(setting)
    if (setting != 1 && setting != 0)
       raise "Error setting Coreference."
    end
    @coreference = setting
  end

  def getQuotations()
    return @quotations
  end

  def setQuotations(setting)
    if (setting != 1 && setting != 0)
       raise "Error setting Quotations."
    end
    @quotations = setting
  end

  def getSourceText()
    return @sourceText
  end

  def setSourceText(setting)
    if (setting != "cleaned_or_raw" &&
        setting != "cleaned" &&
        setting != "raw" &&
        setting != "cquery" &&
        setting != "xpath")
      raise "Error setting SourceText."
    end
    @sourceText = setting
  end

  def getShowSourceText()
    return @showSourceText
  end

  def setShowSourceText(setting)
    if (setting != 1 && setting != 0)
      raise "Error setting ShowSourceText."
    end
    @showSourceText = setting
  end
  
  def getSentiment()
    return @sentiment
  end
  
  def setSentiment(setting)
    if (setting != 1 && setting != 0)
	  raise "Error setting Sentiment."
	end
	@sentiment = setting
  end

  def getMaxRetrieve()
    return @maxRetrieve
  end

  def setMaxRetrieve(setting)
    unless (setting.is_a?(Integer)) then
      raise "Error setting MaxRetrieve."
    end
    @maxRetrieve = setting
  end

  def getBaseUrl()
    return @baseUrl
  end

  def setBaseUrl(setting)
    @baseUrl = setting
  end

  def getConstraintQuery()
    return @cQuery
  end

  def setConstraintQuery(setting)
    @cQuery = setting
  end

  def getXPath()
    return @xPath
  end

  def setXPath(setting)
    @xPath = setting
  end

  def getParameterString()
    retString = super()
    if (@disambiguate != "")
      retString += "&disambiguate=" + URI.escape(@disambiguate.to_s())
    end
    if (@linkedData != "")
      retString += "&linkedData=" + URI.escape(@linkedData.to_s())
    end
    if (@coreference != "")
      retString += "&coreference=" + URI.escape(@coreference.to_s())
    end
    if (@quotations != "")
      retString += "&quotations=" + URI.escape(@quotations.to_s())
    end
    if (@sourceText != "")
      retString += "&sourceText=" + URI.escape(@sourceText)
    end
    if (@showSourceText != "")
      retString += "&showSourceText=" + URI.escape(@showSourceText.to_s())
    end
    if (@maxRetrieve != "")
      retString += "&maxRetrieve=" + URI.escape(@maxRetrieve.to_s())
    end
    if (@baseUrl != "")
      retString += "&baseUrl=" + URI.escape(@baseUrl)
    end
    if (cQuery != "")
      retString += "&cquery=" + URI.escape(@cQuery)
    end
    if (@xPath != "")
      retString += "&xpath=" + URI.escape(@xPath)
    end
    if (@sentiment != "")
      retString += "&sentiment=" + URI.escape(@sentiment.to_s())
    end
    return retString
  end
end


class AlchemyAPI_ConceptParams < AlchemyAPI_Params
  attr_accessor :sourceText
  attr_accessor :showSourceText
  attr_accessor :maxRetrieve
  attr_accessor :linkedData
  attr_accessor :cQuery
  attr_accessor :xPath

  def initialize()
    super()
    @sourceText = ""
    @showSourceText = ""
    @maxRetrieve = ""
    @cQuery = ""
    @xPath = ""
    @linkedData = ""
  end

  def getSourceText()
    return @sourceText
  end

  def setSourceText(setting)
    if (setting != "cleaned_or_raw" &&
        setting != "cleaned" &&
        setting != "raw" &&
        setting != "cquery" &&
        setting != "xpath")
      raise "Error setting SourceText."
    end
    @sourceText = setting
  end

  def getShowSourceText()
    return @showSourceText
  end

  def setShowSourceText(setting)
    if (setting != 1 && setting != 0)
      raise "Error setting ShowSourceText."
    end
    @showSourceText = setting
  end

  def getMaxRetrieve()
    return @maxRetrieve
  end

  def setMaxRetrieve(setting)
    unless (setting.is_a?(Integer)) then
      raise "Error setting MaxRetrieve."
    end
    @maxRetrieve = setting
  end

  def getLinkedData()
    return @linkedData
  end

  def setLinkedData(setting)
    if (setting != 1 && setting != 0)
       raise "Error setting LinkedData."
    end
    @linkedData = setting
  end

  def getConstraintQuery()
    return @cQuery
  end

  def setConstraintQuery(setting)
    @cQuery = setting
  end

  def getXPath()
    return @xPath
  end

  def setXPath(setting)
    @xPath = setting
  end

  def getParameterString()
    retString = super()
    if (@sourceText != "")
      retString += "&sourceText=" + URI.escape(@sourceText)
    end
    if (@showSourceText != "")
      retString += "&showSourceText=" + URI.escape(@showSourceText.to_s())
    end
    if (@maxRetrieve != "")
      retString += "&maxRetrieve=" + URI.escape(@maxRetrieve.to_s())
    end
    if (@linkedData != "")
      retString += "&linkedData=" + URI.escape(@linkedData.to_s())
    end
    if (cQuery != "")
      retString += "&cquery=" + URI.escape(@cQuery)
    end
    if (@xPath != "")
      retString += "&xpath=" + URI.escape(@xPath)
    end
    return retString
  end
end


class AlchemyAPI_KeywordParams < AlchemyAPI_Params
  attr_accessor :sourceText
  attr_accessor :showSourceText
  attr_accessor :sentiment
  attr_accessor :maxRetrieve
  attr_accessor :baseUrl
  attr_accessor :cQuery
  attr_accessor :xPath
  attr_accessor :keywordExtractMode

  def initialize()
    super()
    @sourceText = ""
    @showSourceText = ""
    @maxRetrieve = ""
    @baseUrl = ""
    @cQuery = ""
    @xPath = ""
    @keywordExtractMode = ""
    @sentiment = ""
  end

  def getSourceText()
    return @sourceText
  end

  def setSourceText(setting)
    if (setting != "cleaned_or_raw" &&
        setting != "cleaned" &&
        setting != "raw" &&
        setting != "cquery" &&
        setting != "xpath")
      raise "Error setting SourceText."
    end
    @sourceText = setting
  end

  def getShowSourceText()
    return @showSourceText
  end

  def setShowSourceText(setting)
    if (setting != 1 && setting != 0)
      raise "Error setting ShowSourceText."
    end
    @showSourceText = setting
  end
  
  def getSentiment()
    return @sentiment
  end

  def setSentiment(setting)
    if (setting != 1 && setting != 0)
      raise "Error setting Sentiment."
    end
    @sentiment = setting
  end

  def getMaxRetrieve()
    return @maxRetrieve
  end

  def setMaxRetrieve(setting)
    unless (setting.is_a?(Integer)) then
      raise "Error setting MaxRetrieve."
    end
    @maxRetrieve = setting
  end

  def getBaseUrl()
    return @baseUrl
  end

  def setBaseUrl(setting)
    @baseUrl = setting
  end

  def getConstraintQuery()
    return @cQuery
  end

  def setConstraintQuery(setting)
    @cQuery = setting
  end

  def getXPath()
    return @xPath
  end

  def setXPath(setting)
    @xPath = setting
  end

  def getKeywordExtractMode()
    return @keywordExtractMode
  end

  def setKeywordExtractMode(setting)
    if (setting != "strict" &&
        setting != "normal" &&
        setting != "")
      raise "Error setting KeywordExtractMode."
    end
    @keywordExtractMode = setting
  end

  def getParameterString()
    retString = super()
    if (@sourceText != "")
      retString += "&sourceText=" + URI.escape(@sourceText)
    end
    if (@showSourceText != "")
      retString += "&showSourceText=" + URI.escape(@showSourceText.to_s())
    end
    if (@maxRetrieve != "")
      retString += "&maxRetrieve=" + URI.escape(@maxRetrieve.to_s())
    end
    if (@baseUrl != "")
      retString += "&baseUrl=" + URI.escape(@baseUrl)
    end
    if (cQuery != "")
      retString += "&cquery=" + URI.escape(@cQuery)
    end
    if (@xPath != "")
      retString += "&xpath=" + URI.escape(@xPath)
    end
    if (@keywordExtractMode != "")
      retString += "&keywordExtractMode=" + URI.escape(@keywordExtractMode)
    end
    if (@sentiment != "")
      retString += "&sentiment=" + URI.escape(@sentiment.to_s())
    end
    return retString
  end
end


class AlchemyAPI_CategoryParams < AlchemyAPI_Params
  attr_accessor :sourceText
  attr_accessor :baseUrl
  attr_accessor :cQuery
  attr_accessor :xPath

  def initialize()
    super()
    @sourceText = ""
    @baseUrl = ""
    @cQuery = ""
    @xPath = ""
  end

  def getSourceText()
    return @sourceText
  end

  def setSourceText(setting)
    if (setting != "cleaned_or_raw" &&
        setting != "cquery" &&
        setting != "xpath")
      raise "Error setting SourceText."
    end
    @sourceText = setting
  end

  def getBaseUrl()
    return @baseUrl
  end

  def setBaseUrl(setting)
    @baseUrl = setting
  end

  def getConstraintQuery()
    return @cQuery
  end

  def setConstraintQuery(setting)
    @cQuery = setting
  end

  def getXPath()
    return @xPath
  end

  def setXPath(setting)
    @xPath = setting
  end

  def getParameterString()
    retString = super()
    if (@sourceText != "")
      retString += "&sourceText=" + URI.escape(@sourceText)
    end
    if (@baseUrl != "")
      retString += "&baseUrl=" + URI.escape(@baseUrl)
    end
    if (cQuery != "")
      retString += "&cquery=" + URI.escape(@cQuery)
    end
    if (@xPath != "")
      retString += "&xpath=" + URI.escape(@xPath)
    end
    return retString
  end
end


class AlchemyAPI_LanguageParams < AlchemyAPI_Params
  attr_accessor :sourceText
  attr_accessor :cQuery
  attr_accessor :xPath

  def initialize()
    super()
    @sourceText = ""
    @cQuery = ""
    @xPath = ""
  end

  def getSourceText()
    return @sourceText
  end

  def setSourceText(setting)
    if (setting != "cleaned_or_raw" &&
        setting != "cleaned" &&
        setting != "raw" &&
        setting != "cquery" &&
        setting != "xpath")
      raise "Error setting SourceText."
    end
    @sourceText = setting
  end

  def getConstraintQuery()
    return @cQuery
  end

  def setConstraintQuery(setting)
    @cQuery = setting
  end

  def getXPath()
    return @xPath
  end

  def setXPath(setting)
    @xPath = setting
  end

  def getParameterString()
    retString = super()
    if (@sourceText != "")
      retString += "&sourceText=" + URI.escape(@sourceText)
    end
    if (cQuery != "")
      retString += "&cquery=" + URI.escape(@cQuery)
    end
    if (@xPath != "")
      retString += "&xpath=" + URI.escape(@xPath)
    end
    return retString
  end
end


class AlchemyAPI_RelationParams < AlchemyAPI_Params
  attr_accessor :sourceText
  attr_accessor :maxRetrieve
  attr_accessor :baseUrl
  attr_accessor :cQuery
  attr_accessor :xPath

  def initialize()
    super()
    @disambiguate = ""
    @linkedData = ""
    @coreference = ""
    @entities = ""
    @sentimentExcludeEntities = ""
    @requireEntities = ""
    @sourceText = ""
    @showSourceText = ""
    @sentiment = ""
    @maxRetrieve = ""
    @baseUrl = ""
    @cQuery = ""
    @xPath = ""
  end

  def getDisambiguate()
    return @disambiguate
  end

  def setDisambiguate(setting)
    if (setting != 1 && setting != 0)
       raise "Error setting Disambiguate."
    end
    @disambiguate = setting
  end

  def getLinkedData()
    return @linkedData
  end

  def setLinkedData(setting)
    if (setting != 1 && setting != 0)
       raise "Error setting LinkedData."
    end
    @linkedData = setting
  end

  def getCoreference()
    return @coreference
  end

  def setCoreference(setting)
    if (setting != 1 && setting != 0)
       raise "Error setting Coreference."
    end
    @coreference = setting
  end

  def getSourceText()
    return @sourceText
  end

  def setSourceText(setting)
    if (setting != "cleaned_or_raw" &&
        setting != "cleaned" &&
        setting != "raw" &&
        setting != "cquery" &&
        setting != "xpath")
      raise "Error setting SourceText."
    end
    @sourceText = setting
  end

  def getShowSourceText()
    return @showSourceText
  end

  def setShowSourceText(setting)
    if (setting != 1 && setting != 0)
      raise "Error setting ShowSourceText."
    end
    @showSourceText = setting
  end
  
  def getSentiment()
    return @sentiment
  end
  
  def setSentiment(setting)
    if (setting != 1 && setting != 0)
	  raise "Error setting Sentiment."
	end
	@sentiment = setting
  end
  
  def getEntities()
    return @entities
  end
  
  def setEntities(setting)
    if (setting != 1 && setting != 0)
	  raise "Error setting Entities."
	end
	@entities = setting
  end
  
  def getSentimentExcludeEntities()
    return @sentimentExcludeEntities
  end
  
  def setSentimentExcludeEntities(setting)
    if (setting != 1 && setting != 0)
	  raise "Error setting SentimentExcludeEntities."
	end
	@sentimentExcludeEntities = setting
  end
  
  def getRequireEntities()
    return @requireEntities
  end
  
  def setRequireEntities(setting)
    if (setting != 1 && setting != 0)
	  raise "Error setting RequireEntities."
	end
	@requireEntities = setting
  end

  def getMaxRetrieve()
    return @maxRetrieve
  end

  def setMaxRetrieve(setting)
    unless (setting.is_a?(Integer)) then
      raise "Error setting MaxRetrieve."
    end
    @maxRetrieve = setting
  end

  def getBaseUrl()
    return @baseUrl
  end

  def setBaseUrl(setting)
    @baseUrl = setting
  end

  def getConstraintQuery()
    return @cQuery
  end

  def setConstraintQuery(setting)
    @cQuery = setting
  end

  def getXPath()
    return @xPath
  end

  def setXPath(setting)
    @xPath = setting
  end

  def getParameterString()
    retString = super()
    if (@disambiguate != "")
      retString += "&disambiguate=" + URI.escape(@disambiguate.to_s())
    end
    if (@linkedData != "")
      retString += "&linkedData=" + URI.escape(@linkedData.to_s())
    end
    if (@coreference != "")
      retString += "&coreference=" + URI.escape(@coreference.to_s())
    end
    if (@sourceText != "")
      retString += "&sourceText=" + URI.escape(@sourceText)
    end
    if (@showSourceText != "")
      retString += "&showSourceText=" + URI.escape(@showSourceText.to_s())
    end
    if (@maxRetrieve != "")
      retString += "&maxRetrieve=" + URI.escape(@maxRetrieve.to_s())
    end
    if (@baseUrl != "")
      retString += "&baseUrl=" + URI.escape(@baseUrl)
    end
    if (cQuery != "")
      retString += "&cquery=" + URI.escape(@cQuery)
    end
    if (@xPath != "")
      retString += "&xpath=" + URI.escape(@xPath)
    end
    if (@sentiment != "")
      retString += "&sentiment=" + URI.escape(@sentiment.to_s())
    end
    if (@entities != "")
      retString += "&entities=" + URI.escape(@entities.to_s())
    end
    if (@requireEntities != "")
      retString += "&requireEntities=" + URI.escape(@requireEntities.to_s())
    end
    if (@sentimentExcludeEntities != "")
      retString += "&sentimentExcludeEntities=" + URI.escape(@sentimentExcludeEntities.to_s())
    end
    return retString
  end
end


class AlchemyAPI_TextParams < AlchemyAPI_Params
  def initialize()
    super()
    @useMetaData = ""
    @extractLinks = ""
  end

  def getUseMetaData()
    return @useMetaData
  end

  def setUseMetaData(setting)
    if (setting != 1 && setting != 0)
      raise "Error setting UseMetaData."
    end
    @useMetaData = setting
  end

  def getExtractLinks()
    return @extractLinks
  end

  def setExtractLinks(setting)
    if (setting != 1 && setting != 0)
      raise "Error setting ExtractLinks."
    end
    @extractLinks = setting
  end

  def getParameterString()
    retString = super()
    if (@useMetaData != "")
      retString += "&useMetaData=" + URI.escape(@useMetaData.to_s())
    end
    if (@extractLinks != "")
      retString += "&extractLinks=" + URI.escape(@extractLinks.to_s())
    end
    return retString
  end
end


class AlchemyAPI_ConstraintQueryParams < AlchemyAPI_Params
  attr_accessor :cQuery

  def initialize()
    super()
    @cQuery = ""
  end

  def getConstraintQuery()
    return @cQuery
  end

  def setConstraintQuery(setting)
    @cQuery = setting
  end

  def getParameterString()
    retString = super()
    if (cQuery != "")
      retString += "&cquery=" + URI.escape(@cQuery)
    end
    return retString
  end
end


class AlchemyAPI
  class OutputMode
    XML = "xml";
    JSON = "json";
    RDF = "rdf";
  end

  attr_accessor :apiKey
  attr_accessor :hostPrefix

  def initialize()
    @apiKey
    @hostPrefix = "access"
  end

  def setAPIHost(host)
    @hostPrefix = host
    if (@hostPrefix.length < 2)
       raise "Error setting API host."
    end
  rescue => err
    raise "Error setting API host: #{err}"
  end

  def setAPIKey(key)
    @apiKey = key
    if (@apiKey.length < 5)
       raise "Error setting API key."
    end
  rescue => err
    raise "Error setting API key: #{err}"
  end

  def loadAPIKey(filename)
    @apiKey = ""
    file = File.new(filename, "r")
    if (line = file.gets)
	@apiKey = line.strip
    end
    file.close
    if (@apiKey.length < 5)
       raise "Error loading API key."
    end
  rescue => err
    raise "Error loading API key: #{err}"
  end

  def URLGetRankedNamedEntities(url, outputMode = OutputMode::XML,
                                namedEntityParams = nil)
    CheckURL(url, outputMode)

    if (namedEntityParams != nil && namedEntityParams.class != AlchemyAPI_NamedEntityParams &&
	namedEntityParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (namedEntityParams == nil)
      namedEntityParams = AlchemyAPI_NamedEntityParams.new()
    end
    namedEntityParams.setUrl(url)
    namedEntityParams.setOutputMode(outputMode)

    DoGet("URLGetRankedNamedEntities", "url", namedEntityParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def TextGetRankedNamedEntities(text, outputMode = OutputMode::XML,
                                 namedEntityParams = nil)
    CheckText(text, outputMode)

    if (namedEntityParams != nil && namedEntityParams.class != AlchemyAPI_NamedEntityParams &&
        namedEntityParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (namedEntityParams == nil)
      namedEntityParams = AlchemyAPI_NamedEntityParams.new()
    end
    namedEntityParams.setText(text)
    namedEntityParams.setOutputMode(outputMode)

    DoPost("TextGetRankedNamedEntities", "text", namedEntityParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def HTMLGetRankedNamedEntities(html, url, outputMode = OutputMode::XML,
                                 namedEntityParams = nil)
    CheckHTML(html, url, outputMode)

    if (namedEntityParams != nil && namedEntityParams.class != AlchemyAPI_NamedEntityParams &&
        namedEntityParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (namedEntityParams == nil)
      namedEntityParams = AlchemyAPI_NamedEntityParams.new()
    end
    namedEntityParams.setHtml(html)
    namedEntityParams.setUrl(url)
    namedEntityParams.setOutputMode(outputMode)

    DoPost("HTMLGetRankedNamedEntities", "html", namedEntityParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def URLGetRankedConcepts(url, outputMode = OutputMode::XML,
                           conceptParams = nil)
    CheckURL(url, outputMode)

    if (conceptParams != nil && conceptParams.class != AlchemyAPI_ConceptParams &&
        conceptParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (conceptParams == nil)
      conceptParams = AlchemyAPI_ConceptParams.new()
    end
    conceptParams.setUrl(url)
    conceptParams.setOutputMode(outputMode)

    DoGet("URLGetRankedConcepts", "url", conceptParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def TextGetRankedConcepts(text, outputMode = OutputMode::XML,
                            conceptParams = nil)
    CheckText(text, outputMode)

    if (conceptParams != nil && conceptParams.class != AlchemyAPI_ConceptParams &&
        conceptParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (conceptParams == nil)
      conceptParams = AlchemyAPI_ConceptParams.new()
    end
    conceptParams.setText(text)
    conceptParams.setOutputMode(outputMode)

    DoPost("TextGetRankedConcepts", "text", conceptParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def HTMLGetRankedConcepts(html, url, outputMode = OutputMode::XML,
                            conceptParams = nil)
    CheckHTML(html, url, outputMode)

    if (conceptParams != nil && conceptParams.class != AlchemyAPI_ConceptParams &&
        conceptParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (conceptParams == nil)
      conceptParams = AlchemyAPI_ConceptParams.new()
    end
    conceptParams.setUrl(url)
    conceptParams.setHtml(html)
    conceptParams.setOutputMode(outputMode)

    DoPost("HTMLGetRankedConcepts", "html", conceptParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def URLGetRankedKeywords(url, outputMode = OutputMode::XML,
                           keywordParams = nil)
    CheckURL(url, outputMode)

    if (keywordParams != nil && keywordParams.class != AlchemyAPI_KeywordParams &&
        keywordParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (keywordParams == nil)
      keywordParams = AlchemyAPI_KeywordParams.new()
    end
    keywordParams.setUrl(url)
    keywordParams.setOutputMode(outputMode)

    DoGet("URLGetRankedKeywords", "url", keywordParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def TextGetRankedKeywords(text, outputMode = OutputMode::XML,
                            keywordParams = nil)
    CheckText(text, outputMode)

    if (keywordParams != nil && keywordParams.class != AlchemyAPI_KeywordParams &&
        keywordParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (keywordParams == nil)
      keywordParams = AlchemyAPI_KeywordParams.new()
    end
    keywordParams.setText(text)
    keywordParams.setOutputMode(outputMode)

    DoPost("TextGetRankedKeywords", "text", keywordParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def HTMLGetRankedKeywords(html, url, outputMode = OutputMode::XML,
                            keywordParams = nil)
    CheckHTML(html, url, outputMode)

    if (keywordParams != nil && keywordParams.class != AlchemyAPI_KeywordParams &&
        keywordParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (keywordParams == nil)
      keywordParams = AlchemyAPI_KeywordParams.new()
    end
    keywordParams.setUrl(url)
    keywordParams.setHtml(html)
    keywordParams.setOutputMode(outputMode)

    DoPost("HTMLGetRankedKeywords", "html", keywordParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def URLGetLanguage(url, outputMode = OutputMode::XML,
                     languageParams = nil)
    CheckURL(url, outputMode)

    if (languageParams != nil && languageParams.class != AlchemyAPI_LanguageParams &&
        languageParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (languageParams == nil)
      languageParams = AlchemyAPI_LanguageParams.new()
    end
    languageParams.setUrl(url)
    languageParams.setOutputMode(outputMode)

    DoGet("URLGetLanguage", "url", languageParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def TextGetLanguage(text, outputMode = OutputMode::XML,
                      languageParams = nil)
    CheckText(text, outputMode)

    if (languageParams != nil && languageParams.class != AlchemyAPI_LanguageParams &&
        languageParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (languageParams == nil)
      languageParams = AlchemyAPI_LanguageParams.new()
    end
    languageParams.setText(text)
    languageParams.setOutputMode(outputMode)

    DoPost("TextGetLanguage", "text", languageParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def HTMLGetLanguage(html, url, outputMode = OutputMode::XML,
                      languageParams = nil)
    CheckHTML(html, url, outputMode)

    if (languageParams != nil && languageParams.class != AlchemyAPI_LanguageParams &&
        languageParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (languageParams == nil)
      languageParams = AlchemyAPI_LanguageParams.new()
    end
    languageParams.setUrl(url)
    languageParams.setHtml(html)
    languageParams.setOutputMode(outputMode)

    DoPost("HTMLGetLanguage", "html", languageParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def URLGetRawText(url, outputMode = OutputMode::XML,
                    params = nil)
    CheckURL(url, outputMode)

    if (params != nil && params.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (params == nil)
      params = AlchemyAPI_Params.new()
    end
    params.setUrl(url)
    params.setOutputMode(outputMode)

    DoGet("URLGetRawText", "url", params);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def HTMLGetRawText(html, url, outputMode = OutputMode::XML,
                     params = nil)
    CheckHTML(html, url, outputMode)

    if (params != nil && params.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (params == nil)
      params = AlchemyAPI_Params.new()
    end
    params.setUrl(url)
    params.setHtml(html)
    params.setOutputMode(outputMode)

    DoPost("HTMLGetRawText", "html", params);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def URLGetText(url, outputMode = OutputMode::XML,
                 textParams = nil)
    CheckURL(url, outputMode)

    if (textParams != nil && textParams.class != AlchemyAPI_TextParams &&
        textParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (textParams == nil)
      textParams = AlchemyAPI_TextParams.new()
    end
    textParams.setUrl(url)
    textParams.setOutputMode(outputMode)

    DoGet("URLGetText", "url", textParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def HTMLGetText(html, url, outputMode = OutputMode::XML,
                  textParams = nil)
    CheckHTML(html, url, outputMode)

    if (textParams != nil && textParams.class != AlchemyAPI_TextParams &&
        textParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (textParams == nil)
      textParams = AlchemyAPI_TextParams.new()
    end
    textParams.setUrl(url)
    textParams.setHtml(html)
    textParams.setOutputMode(outputMode)

    DoPost("HTMLGetText", "html", textParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def URLGetTitle(url, outputMode = OutputMode::XML,
                  params = nil)
    CheckURL(url, outputMode)

    if (params != nil && params.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (params == nil)
      params = AlchemyAPI_Params.new()
    end
    params.setUrl(url)
    params.setOutputMode(outputMode)

    DoGet("URLGetTitle", "url", params);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def HTMLGetTitle(html, url, outputMode = OutputMode::XML,
                   params = nil)
    CheckHTML(html, url, outputMode)

    if (params != nil && params.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (params == nil)
      params = AlchemyAPI_Params.new()
    end
    params.setUrl(url)
    params.setHtml(html)
    params.setOutputMode(outputMode)

    DoPost("HTMLGetTitle", "html", params);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def URLGetCategory(url, outputMode = OutputMode::XML,
                     categParams = nil)
    CheckURL(url, outputMode)

    if (categParams != nil && categParams.class != AlchemyAPI_CategoryParams &&
        categParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (categParams == nil)
      categParams = AlchemyAPI_CategoryParams.new()
    end
    categParams.setUrl(url)
    categParams.setOutputMode(outputMode)

    DoGet("URLGetCategory", "url", categParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def HTMLGetCategory(html, url, outputMode = OutputMode::XML,
                      categParams = nil)
    CheckHTML(html, url, outputMode)

    if (categParams != nil && categParams.class != AlchemyAPI_CategoryParams &&
        categParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (categParams == nil)
      categParams = AlchemyAPI_CategoryParams.new()
    end
    categParams.setUrl(url)
    categParams.setHtml(html)
    categParams.setOutputMode(outputMode)

    DoPost("HTMLGetCategory", "html", categParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def TextGetCategory(text, outputMode = OutputMode::XML,
                      categParams = nil)
    CheckText(text, outputMode)

    if (categParams != nil && categParams.class != AlchemyAPI_CategoryParams &&
        categParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (categParams == nil)
      categParams = AlchemyAPI_CategoryParams.new()
    end
    categParams.setText(text)
    categParams.setOutputMode(outputMode)

    DoPost("TextGetCategory", "text", categParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def URLGetFeedLinks(url, outputMode = OutputMode::XML,
                      params = nil)
    CheckURL(url, outputMode)

    if (params != nil && params.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (params == nil)
      params = AlchemyAPI_Params.new()
    end
    params.setUrl(url)
    params.setOutputMode(outputMode)

    DoGet("URLGetFeedLinks", "url", params);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def HTMLGetFeedLinks(html, url, outputMode = OutputMode::XML,
                       params = nil)
    CheckHTML(html, url, outputMode)

    if (params != nil && params.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (params == nil)
      params = AlchemyAPI_Params.new()
    end
    params.setUrl(url)
    params.setHtml(html)
    params.setOutputMode(outputMode)

    DoPost("HTMLGetFeedLinks", "html", params);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def URLGetMicroformats(url, outputMode = OutputMode::XML,
                         params = nil)
    CheckURL(url, outputMode)

    if (params != nil && params.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (params == nil)
      params = AlchemyAPI_Params.new()
    end
    params.setUrl(url)
    params.setOutputMode(outputMode)

    DoGet("URLGetMicroformatData", "url", params);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def HTMLGetMicroformats(html, url, outputMode = OutputMode::XML,
                          params = nil)
    CheckHTML(html, url, outputMode)

    if (params != nil && params.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (params == nil)
      params = AlchemyAPI_Params.new()
    end
    params.setUrl(url)
    params.setHtml(html)
    params.setOutputMode(outputMode)

    DoPost("HTMLGetMicroformatData", "html", params);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def URLGetConstraintQuery(url, query, outputMode = OutputMode::XML,
                            cqueryParams = nil)
    CheckURL(url, outputMode)

    if (query.length < 2)
      raise "Invalid constraint query specified."
    end

    if (cqueryParams != nil && cqueryParams.class != AlchemyAPI_ConstraintQueryParams &&
        cqueryParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (cqueryParams == nil)
      cqueryParams = AlchemyAPI_ConstraintQueryParams.new()
    end
    cqueryParams.setUrl(url)
    cqueryParams.setConstraintQuery(query)
    cqueryParams.setOutputMode(outputMode)

    DoGet("URLGetConstraintQuery", "url", cqueryParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def HTMLGetConstraintQuery(html, url, query, outputMode = OutputMode::XML,
                             cqueryParams = nil)
    CheckHTML(html, url, outputMode)
    
    if (query.length < 2)
      raise "Invalid constraint query specified."
    end

    if (cqueryParams != nil && cqueryParams.class != AlchemyAPI_ConstraintQueryParams &&
        cqueryParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (cqueryParams == nil)
      cqueryParams = AlchemyAPI_ConstraintQueryParams.new()
    end
    cqueryParams.setUrl(url)
    cqueryParams.setHtml(html)
    cqueryParams.setConstraintQuery(query)
    cqueryParams.setOutputMode(outputMode)

    DoPost("HTMLGetConstraintQuery", "html", cqueryParams);
  rescue => err
    raise "Error making API call: #{err}"
  end
  
  def URLGetTextSentiment(url, outputMode = OutputMode::XML,
                     baseParams = nil)
    CheckURL(url, outputMode)

    if (baseParams != nil && baseParams.class != AlchemyAPI_Params &&
        baseParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (baseParams == nil)
      baseParams = AlchemyAPI_Params.new()
    end
    baseParams.setUrl(url)
    baseParams.setOutputMode(outputMode)

    DoGet("URLGetTextSentiment", "url", baseParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def HTMLGetTextSentiment(html, url, outputMode = OutputMode::XML,
                      baseParams = nil)
    CheckHTML(html, url, outputMode)

    if (baseParams != nil && baseParams.class != AlchemyAPI_Params &&
        baseParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (baseParams == nil)
      baseParams = AlchemyAPI_Params.new()
    end
    baseParams.setUrl(url)
    baseParams.setHtml(html)
    baseParams.setOutputMode(outputMode)

    DoPost("HTMLGetTextSentiment", "html", baseParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def TextGetTextSentiment(text, outputMode = OutputMode::XML,
                      baseParams = nil)
    CheckText(text, outputMode)

    if (baseParams != nil && baseParams.class != AlchemyAPI_Params &&
        baseParams.class != AlchemyAPI_Params)
      raise "Invalid parameters object."
    end
    if (baseParams == nil)
      baseParams = AlchemyAPI_Params.new()
    end
    baseParams.setText(text)
    baseParams.setOutputMode(outputMode)

    DoPost("TextGetTextSentiment", "text", baseParams);
  rescue => err
    raise "Error making API call: #{err}"
  end
  
  def URLGetRelations(url, outputMode = OutputMode::XML,
                     relationParams = nil)
    CheckURL(url, outputMode)

    if (relationParams != nil && relationParams.class != AlchemyAPI_RelationParams &&
        relationParams.class != AlchemyAPI_RelationParams)
      raise "Invalid parameters object."
    end
    if (relationParams == nil)
      relationParams = AlchemyAPI_RelationParams.new()
    end
    relationParams.setUrl(url)
    relationParams.setOutputMode(outputMode)

    DoGet("URLGetRelations", "url", relationParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def HTMLGetRelations(html, url, outputMode = OutputMode::XML,
                      relationParams = nil)
    CheckHTML(html, url, outputMode)

    if (relationParams != nil && relationParams.class != AlchemyAPI_RelationParams &&
        relationParams.class != AlchemyAPI_RelationParams)
      raise "Invalid parameters object."
    end
    if (relationParams == nil)
      relationParams = AlchemyAPI_RelationParams.new()
    end
    relationParams.setUrl(url)
    relationParams.setHtml(html)
    relationParams.setOutputMode(outputMode)

    DoPost("HTMLGetRelations", "html", relationParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def TextGetRelations(text, outputMode = OutputMode::XML,
                      relationParams = nil)
    CheckText(text, outputMode)

    if (relationParams != nil && relationParams.class != AlchemyAPI_RelationParams &&
        relationParams.class != AlchemyAPI_RelationParams)
      raise "Invalid parameters object."
    end
    if (relationParams == nil)
      relationParams = AlchemyAPI_RelationParams.new()
    end
    relationParams.setText(text)
    relationParams.setOutputMode(outputMode)

    DoPost("TextGetRelations", "text", relationParams);
  rescue => err
    raise "Error making API call: #{err}"
  end

  def CheckOutputMode(outputMode)
    if (@apiKey.length < 5)
       raise "Please load an API key."
    end
    if (OutputMode::XML != outputMode && OutputMode::JSON != outputMode && OutputMode::RDF != outputMode)
      raise "Illegal Output Mode specified, see OutputMode class."
    end
  end

  def CheckURL(url, outputMode)
    CheckOutputMode(outputMode)
    if (url.length < 5)
      raise "Enter a valid URL to analyze."
    end
  end

  def CheckText(text, outputMode)
    CheckOutputMode(outputMode)
    if (text.length < 10)
      raise "Enter valid text to analyze."
    end
  end

  def CheckHTML(html, url, outputMode)
    CheckURL(url, outputMode)
    if (html.length < 10)
      raise "Enter a valid HTML document to analyze."
    end
  end

  def DoPost(endpoint, prefix, parameterObject)
    httpDest = 'http://' + @hostPrefix + '.alchemyapi.com/calls/' + prefix + '/' + endpoint

    payloadData = "apikey=" + @apiKey + parameterObject.getParameterString()

    httpObj = Net::HTTP.new(@hostPrefix + ".alchemyapi.com", 80);

    response = httpObj.post(httpDest, payloadData)

    return HandleResponse(response, parameterObject)
  end

  def DoGet(endpoint, prefix, parameterObject)
    httpDest = 'http://' + @hostPrefix + '.alchemyapi.com/calls/' + prefix + '/' + endpoint
	
    payloadData = "apikey=" + @apiKey + parameterObject.getParameterString()

    httpDest += "?" + payloadData
	
    uri = URI.parse(httpDest)

    httpObj = Net::HTTP.new(uri.host, 80);

    request = Net::HTTP::Get.new(uri.request_uri) 
    response = httpObj.request(request)

    return HandleResponse(response, parameterObject)
  end

  def HandleResponse(response, parameterObject)
    if (response.code != "200")
      raise "HTTP error."
    end

    if (OutputMode::XML == parameterObject.getOutputMode())
      data = XmlSimple.xml_in(response.body, { 'KeyAttr' => 'name' })
      if (data['status'].first.to_s != "OK")
        raise "#{data['statusInfo']}."
      end
    elsif (OutputMode::RDF == parameterObject.getOutputMode())
      data = XmlSimple.xml_in(response.body, { 'KeyAttr' => 'name' })
      if (data["Description"][0]['ResultStatus'].first.to_s != "OK")
        raise "#{data["Description"][0]['StatusInfo']}."
      end
    else
      data = JSON.parse(response.body)
      if (data['status'].to_s != "OK")
        raise "#{data['statusInfo']}."
      end
    end

    return response.body
  end
end
