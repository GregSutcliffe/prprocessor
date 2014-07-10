class PullRequest

  attr_reader :raw_data, :title

  def initialize(raw_data)
    self.raw_data = raw_data
    self.title = raw_data['title']
  end

  def issue_number
    @title.match(/(((F|f)ixes)|((R|r)efs)) #\d+/)[0].split('#')[1]
  end

  def new?
    @raw_data['created_at'] == @raw_data['updated_at']
  end

end
