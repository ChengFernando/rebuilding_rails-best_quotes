class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, :noun => :winking
  end

  def exception
    raise "It's a bad one"
  end

  def quote_1
    quote_1 = Rulers::Model::FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth one k pixels",
      "attribution" => "me"
    }

    m = FileModel.create(attrs)
    render :quote, :obj => m
  end

  def update
    # raise "POST only route" unless env["REQUEST_METHOD"] == "POST"

    attrs = {
      "submitter" => "test" 
      "quote" => "test",
      "attribution" => "test"     
    } 
    m = FileModel.update(attrs, 1)
    render :quote, :obj => m
  end
    # raise "POST only route" unless env["REQUEST_METHOD"] == "POST"

    # params = env["rack.input"].read.split('&').map { |param|  param.split '=' }.to_h

    # raise "NO ID supplied" unless params["id"]

    # @quote_obj = FileModel.find params["id"].to_i
    # params.keys.each {|key| @quote_obj[key] = params[key]}
    # @quote_obj.save

    # render :quote
end
# test on "rerun" gem 