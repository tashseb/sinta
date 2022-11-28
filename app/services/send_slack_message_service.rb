class SendSlackMessageService
  attr_reader :channel, :message, :token

  def initialize(role:, candidate:)
    @channel = "U04C89KPM8E"
    @role = role
    @candidate = candidate

    @token = ENV['SLACK_TOKEN']
  end

  def call
    response = HTTParty.post(
      'https://slack.com/api/chat.postMessage',
      body: {
        channel: channel,
        blocks: blocks,
        text: "Your Interview Kit for #{@candidate.first_name} #{@candidate.last_name}"
      }.to_json,
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => ('Bearer ' + token)
      }
    )
    p response
  end

  def blocks
    { "text": "Text here for notifications"}
      [

        {
          "type": "header",
			"text": {
				"type": "plain_text",
				"text": " #{@candidate.first_name} #{@candidate.last_name} | Interview Kit  ",
				"emoji": true
			}
		},
		{
			"type": "section",
			"text": {
				"type": "mrkdwn",
				"text": "*Culture Interview* "
			}
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
				"text": "Great to see you! You have an interview with #{@candidate.first_name} today for the #{@role.title} role. We've included your interviewing kit below. _Please remember to sumbit your feedback before the end of your interview_  "
			}
		},
		{
			"type": "divider"
		},
		{
			"type": "section",
			"text": {
				"type": "mrkdwn",
				"text": ":stopwatch: Describe a time where didn't agree with your manager and how you approached it?"
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
						"value": "value-0"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star:",
							"emoji": true
						},
						"value": "value-1"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star::star:",
							"emoji": true
						},
						"value": "value-2"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star::star::star:",
							"emoji": true
						},
						"value": "value-3"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star::star::star::star:",
							"emoji": true
						},
						"value": "value-4"
					}
				],
				"action_id": "static_select-action"
			}
		},
		{
			"type": "context",
			"elements": [
				{
					"type": "image",
					"image_url": "https://pbs.twimg.com/profile_images/625633822235693056/lNGUneLX_400x400.jpg",
					"alt_text": "cute cat"
				},
				{
					"type": "plain_text",
					"text": "Conflict Management",
					"emoji": true
				}
			]
		},
		{
			"type": "divider"
		},
		{
			"type": "section",
			"text": {
				"type": "mrkdwn",
				"text": ":crossed_swords: Have you ever had difficulty working with a manager or other team members?"
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
						"value": "value-0"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star:",
							"emoji": true
						},
						"value": "value-1"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star::star:",
							"emoji": true
						},
						"value": "value-2"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star::star::star:",
							"emoji": true
						},
						"value": "value-3"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star::star::star::star:",
							"emoji": true
						},
						"value": "value-4"
					}
				],
				"action_id": "static_select-action"
			}
		},
		{
			"type": "context",
			"elements": [
				{
					"type": "image",
					"image_url": "https://pbs.twimg.com/profile_images/625633822235693056/lNGUneLX_400x400.jpg",
					"alt_text": "cute cat"
				},
				{
					"type": "plain_text",
					"text": "Teamwork",
					"emoji": true
				}
			]
		},
		{
			"type": "divider"
		},
		{
			"type": "section",
			"text": {
				"type": "mrkdwn",
				"text": ":herb: Describe a time where didn't agree with your manager and how you approached it?"
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
						"value": "value-0"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star:",
							"emoji": true
						},
						"value": "value-1"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star::star:",
							"emoji": true
						},
						"value": "value-2"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star::star::star:",
							"emoji": true
						},
						"value": "value-3"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star::star::star::star:",
							"emoji": true
						},
						"value": "value-4"
					}
				],
				"action_id": "static_select-action"
			}
		},
		{
			"type": "context",
			"elements": [
				{
					"type": "image",
					"image_url": "https://pbs.twimg.com/profile_images/625633822235693056/lNGUneLX_400x400.jpg",
					"alt_text": "cute cat"
				},
				{
					"type": "plain_text",
					"text": "Critical Thinking",
					"emoji": true
				}
			]
		},
		{
			"type": "divider"
		},
		{
			"type": "section",
			"text": {
				"type": "mrkdwn",
				"text": ":female-artist: Can you tell me about a time when you demonstrated leadership skills?"
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
						"value": "value-0"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star:",
							"emoji": true
						},
						"value": "value-1"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star::star:",
							"emoji": true
						},
						"value": "value-2"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star::star::star:",
							"emoji": true
						},
						"value": "value-3"
					},
					{
						"text": {
							"type": "plain_text",
							"text": ":star::star::star::star::star:",
							"emoji": true
						},
						"value": "value-4"
					}
				],
				"action_id": "static_select-action"
			}
		},
		{
			"type": "context",
			"elements": [
				{
					"type": "image",
					"image_url": "https://pbs.twimg.com/profile_images/625633822235693056/lNGUneLX_400x400.jpg",
					"alt_text": "cute cat"
				},
				{
					"type": "plain_text",
					"text": "Leadership",
					"emoji": true
				}
			]
		},
		{
			"type": "input",
			"element": {
				"type": "plain_text_input",
				"multiline": true,
				"action_id": "plain_text_input-action"
			},
			"label": {
				"type": "plain_text",
				"text": "Notes",
				"emoji": true
			}
		},
		{
			"type": "divider"
		},
		{
			"type": "header",
			"text": {
				"type": "plain_text",
				"text": "Final Decision",
				"emoji": true
			}
		},
		{
			"type": "actions",
			"elements": [
				{
					"type": "button",
					"text": {
						"type": "plain_text",
						"emoji": true,
						"text": ":thumbsup:"
					},
					"style": "primary",
					"value": "click_me_123"
				},
				{
					"type": "button",
					"text": {
						"type": "plain_text",
						"emoji": true,
						"text": ":thumbsdown:"
					},
					"style": "danger",
					"value": "click_me_123"
				},
				{
					"type": "button",
					"text": {
						"type": "plain_text",
						"emoji": true,
						"text": ":fire:"
					},
					"style": "primary",
					"value": "click_me_123"
            }
          ]
        }
      ]

  end
end
