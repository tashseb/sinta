require 'json'

class Api::V1::SlackController < ActionController::API

  def webhook
    # params coming from Slack
    puts params['payload']
    payload = JSON.parse( params['payload'])
    puts "Payload from Slack:"
    pp payload
    puts
    # you specified the block_id in the message you built
    interview_id = payload['message']['blocks'][-1]['elements'][0]['alt_text'].to_i
    @interview = Interview.find(interview_id)
    sum = payload['state']['values'].values[0..-2].sum do |value|
      value['static_select-action']['selected_option'] ? JSON.parse(value['static_select-action']['selected_option']['value'])['answer_value'] : 0
    end
    average = sum.to_f/ payload['state']['values'].values[0..-2].length
    @interview.rating = average
    @interview.feedback = payload['state']['values'].values[-1]['plain_text_input-action']['value']
    @interview.save
    render status: 200, json: { response_type: "ephemeral", text: "Thanks for your feedback!" }.to_json
    head :no_content
  end



end
