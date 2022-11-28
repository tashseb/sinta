module SlackNotifier
  CLIENT = Slack::Notifier.new ENV['SLACK_WEBHOOK_URL']
end
