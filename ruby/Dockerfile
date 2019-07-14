FROM ruby:2.6-alpine AS builder
WORKDIR /pipeline
RUN apk update && apk add cmake pkgconfig make build-base openssl-dev
COPY . /pipeline
RUN bundle install --deployment --without test development

FROM ruby:2.6-alpine
COPY --from=builder /pipeline /pipeline
CMD ["sh"]
