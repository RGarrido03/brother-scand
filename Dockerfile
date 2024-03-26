FROM alpine:3

# Install build tools
RUN apk add --update alpine-sdk bsd-compat-headers

# Install imagemagick for PDF conversion
RUN apk add --update imagemagick

# Copy source
COPY . .

# Build
RUN make
RUN make install

WORKDIR /etc/brother-scand

EXPOSE 68 137 138 161 49424 54921 54925
CMD [ "brother-scand", "-c", "scanner.conf" ]