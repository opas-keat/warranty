# Stage 1
# FROM opas/flutter:3.7.6 AS build-env
FROM ghcr.io/cirruslabs/flutter:3.10.0 AS build-env
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter pub get
RUN flutter build web --release --base-href /warranty/

# Stage 2
FROM nginx:1.25.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html