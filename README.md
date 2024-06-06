# Motto

A site to generate random motto.

## Introduction

Motto is a web application designed to encourage English language learning. It generates random mottos that motivate and inspire learners on their language journey.

## Features

- Randomly generated motto every day.
- Share the motto on social media.

## Development

It need run redis for `hotwire-livereload`

```bash
docker run -d --name redis -p 6379:6379 redis
```

## Run it locally

```bash
docker build -t motto .
docker run -d -p 3000:3000 -p 443:443 -v ~/motto/storage:/rails/storage --name motto -e RAILS_MASTER_KEY=$(cat config/master.key) motto
ngrok http 3000
# Open a bash shell inside the container
docker exec -it motto bash
```
