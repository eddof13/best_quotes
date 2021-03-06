class QuotesController < Rulers::Controller
  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end

  def show
    quote = FileModel.find(params['id'])
    render_response :quote, :obj => quote, :ua => request.user_agent
  end

  def a_quote
    render :a_quote, :noun => :winking
  end

  def quote_1
    quote_1 = Rulers::Model::FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is your mom",
      "attribution" => "me"
    }

    m = FileModel.create(attrs)
    render :quote, :obj => m
  end
end