class Api::V1::SlackController < ActionController::API

  def webhook
    # params coming from Slack
    payload = JSON.parse(params['payload'])
    puts "Payload from Slack:"
    p payload
    puts
    # you specified the block_id in the message you built
    action = payload['message']['blocks'].first['block_id']

    case action
    when 'whatever action you specified in your block_id'
      #do stuff
    end

    head :no_content
  end

end
