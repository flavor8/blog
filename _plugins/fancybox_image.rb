
# params
# 0 - image
# 1 - tag
# 2 - caption
class ImageWithCaptionTag < Liquid::Tag
  def initialize(tag_name, input, tokens)
    super
    @input = input
  end

  # Lookup allows access to the page/post variables through the tag context
  def lookup(context, name)
    lookup = context
    name.split(".").each { |value| lookup = lookup[value] }
    lookup
  end

  def render(context)

    # Accessing the page/site variable for the base url
    baseurl = "#{lookup(context, 'site.baseurl')}"
    tag = ""
    caption = ""
    img = ""

    begin
      if( !@input.nil? && !@input.empty? )
        jdata = JSON.parse(@input)
        img = jdata["img"].strip
        tag = jdata["tag"].strip
        caption = jdata["caption"].strip
      end
    rescue
    end

    # Reading the tag parameter (using the pipe-split technique)
#    input_split = split_params(@input)        
#    img_path = input_split[0].strip.downcase
#    tag = input_split[1].strip.downcase
    # Caption is an optional second parameter
#    if( input_split.length > 2 )
#      caption = input_split[2].strip
#    else
#      caption = ""      
#    end

    return "<a data-fancybox=\"#{tag}\" href=\"#{baseurl}/images/#{img}\" data-caption=\"#{caption}\" title=\"#{caption}\"><img src=\"#{baseurl}/images/small/#{img}\"></a>"
  end

  def split_params(params)
    params.split("|")
  end
end
Liquid::Template.register_tag('fb', ImageWithCaptionTag)

