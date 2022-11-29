class SendQuestions < ApplicationJob
  queue_as :default


  def perform(interview)

    SendSlackMessageService.new(
      token: ENV['SLACK_TOKEN'],
      channel: ENV['SLACK_CHANNEL_ID'],
      message: build_questions(interview),
      interview: interview
    ).call
  end


  def build_questions(interview)
   message = [
      {
        "type": "header",
        "text": {
          "type": "plain_text",
          "text": "Interview Kit | #{interview.candidate.first_name} #{interview.candidate.last_name}- Interview Kit ",
          "emoji": true
        },

      },
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "*#{interview.stage.name} Interview* "
        }
      },
      {
        "type": "divider"
      },
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "Hi :wave:"
        }
      },
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "Great to see you! You have an interview with #{interview.candidate.first_name} today for the #{interview.stage.role.title} role. We've included your interviewing kit below. _Please remember to sumbit your feedback before the end of your interview_  "
        }
      },
      {
        "type": "divider"
      }
    ]


    interview.stage.questions.each do |question|
      message << {
      "type": "section",
      "text": {
        "type": "mrkdwn",
        "text": ":question: #{question.description}"
      },
      "accessory": {
        "type": "static_select",
        "placeholder": {
          "type": "plain_text",
          "text": "Rate: 1-5 :star:",
          "emoji": true
        },
        "options": [
          {
            "text": {
              "type": "plain_text",
              "text": ":star:",
              "emoji": true
            },
            "value": { :question_id => question.id, :answer_value => 1}.to_json
          },
          {
            "text": {
              "type": "plain_text",
              "text": ":star::star:",
              "emoji": true
            },
            "value": { :question_id => question.id, :answer_value => 2}.to_json
          },
          {
            "text": {
              "type": "plain_text",
              "text": ":star::star::star:",
              "emoji": true
            },
            "value": { :question_id => question.id, :answer_value => 3}.to_json
          },
          {
            "text": {
              "type": "plain_text",
              "text": ":star::star::star::star:",
              "emoji": true
            },
            "value": { :question_id => question.id, :answer_value => 4 }.to_json
          },
          {
            "text": {
              "type": "plain_text",
              "text": ":star::star::star::star::star:",
              "emoji": true
            },
            "value": { :question_id => question.id, :answer_value => 5 }.to_json
          }
        ],
        "action_id": "static_select-action"
      },
    }
    end

    message << {
        "type": "input",
        "element": {
          "type": "plain_text_input",
          "multiline": true,
          "action_id": "plain_text_input-action"
        },
        "label": {
          "type": "plain_text",
          "text": "Label",
          "emoji": true
        }
    }
    message << {
        "type": "context",
        "elements": [
          {
            "type": "image",
            "image_url": "https://pbs.twimg.com/profile_images/625633822235693056/lNGUneLX_400x400.jpg",
            "alt_text": "#{interview.id}"
          },
          {
            "type": "mrkdwn",
            "text": "*Made* with love."
          }
        ]

      }

      message << {

          "type": "actions",
          "elements": [
            {
              "type": "button",
              "text": {
                "type": "plain_text",
                "emoji": true,
                "text": "Approve"
              },
              "style": "primary",
              "value": "click_me_123"
            },
            {
              "type": "button",
              "text": {
                "type": "plain_text",
                "emoji": true,
                "text": "Reject"
              },
              "style": "danger",
              "value": "click_me_123"
            }
          ]
      }





    return message
  end


end
