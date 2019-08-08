FROM ruby:2.6-alpine AS builder
ENV BUNDLE_APP_CONFIG=/pipeline/.bundle
WORKDIR /pipeline
RUN apk update && apk add cmake pkgconfig make build-base openssl-dev
COPY Gemfile* /pipeline/
RUN bundle install --deployment --without test development
COPY . /pipeline/

FROM ruby:2.6-alpine
ENV BUNDLE_APP_CONFIG=/pipeline/.bundle
WORKDIR /pipeline
COPY --from=builder /pipeline /pipeline
USER nobody
CMD ["sh"]
