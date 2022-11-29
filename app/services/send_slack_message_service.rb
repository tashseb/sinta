class SendSlackMessageService
  attr_reader :channel, :message, :token

  def initialize(attributes)
    @channel = attributes[:channel]
    @message = attributes[:message]
    @token = attributes[:token]
    @interview = attributes[:interview]
  end

  def call
    response = HTTParty.post(
      'https://slack.com/api/chat.postMessage',
      body: {
        channel: channel,
        blocks: message,
        text: "Your Interview Kit for #{@interview.candidate.first_name} #{@interview.candidate.last_name}"
      }.to_json,
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => ('Bearer ' + token)
      }
    )
    p response
  end

end
