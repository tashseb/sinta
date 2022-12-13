 # Sinta 🚀
#### Stop wasting time, hire faster and better.
A Recruitment Management System that helps recruiters to make the hiring process fast and transparent.
🔗  [Sinta Home](https://www.sintaapp.com/)

## Problem:
- Businesses spend too much time & move too slowly on hiring. On average, completing a hiring cycle will take 2-3 months
- Lack of collaboration creates the need for unnecessary meetings. Not enough information or data on what's working and what's not.

## Solution:
Sinta is a Web app that integrates with Slack's API that allows teams to quickly assess candidates realtime and reduce time to a decision.  

- Setup an interview in seconds ~ interview guides based on competencies
- Faster decisions ~ Debrief on interviews & collaborate asynchronously. Hire within days, not weeks

 <img width="1507" alt="Sinta Dashboard" src="https://user-images.githubusercontent.com/114022804/205541769-bc8de7fe-ce85-465d-b932-479a3a94d023.png">

### Slack Intergration
<img width="1451" alt="Sinta Slack" src="https://user-images.githubusercontent.com/114022804/205540405-82b255b1-52b7-4913-b102-090871c0e263.png">



## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
SLACK_WEBHOOK_URL=*******************
SLACK_TOKEN=*******************
SLACK_CHANNEL_ID=***********
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```


### Prerequisites:
***
Slack App with the following features / functionality:
- Incoming Webhooks
- Interactive Components
- Bots
- Permissions
- Getting Started
- Slack App
- Create a Slack App from the slack API to act as communication (interview kits) and data collection (responses and feedback).

Paste the following into Request URL field in Interactivity & Shortcuts tab

```
https://kyoro-manager.herokuapp.com/api/v1/user_answers
```

Create a Slash Interview Kit to collect Feedback From your Team Members on Canadiates in Your Interview Cycles!
 
```
https://kyoro-manager.herokuapp.com/api/v1/user_answers
```
.env FILE
Add your Slack Channel ID to the .env file, example below

```
SLACK_CHANNEL_ID=###########
```

Add your Bot User OAuth Token to .env file, found in Slack App > Settings > Install App, example below

```
SLACK_TOKEN=xoxb-############-############-##################
```


Add a Webhook to Workspace Then copy the webhook and add to .env file, example below

```
SLACK_WEBHOOK_URL=https://hooks.slack.com/services/########/########/###############
```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Team Members
- [Mohamed Shegow](https://www.linkedin.com/in/moeshegow/)
- [Thomas Price](https://www.linkedin.com/in/tom-price/)
- [Sammy Kavanagh](https://www.linkedin.com/in/sammyxxi/)
 
## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## More Screenshots of Platform
![Sinta](https://user-images.githubusercontent.com/13973128/207237758-3bff6ea4-5fd3-4de3-8fbe-f8fa1b2f5dcf.gif)
![Candidate](https://user-images.githubusercontent.com/13973128/207226218-93fdd7ce-7728-4093-b14f-18d1ac6538a9.png)
