FROM craftdock/alpine-base:latest


RUN \
	# Print executed commands
	set -x \
    # Update repository indexes
    && apk update --update-cache \
    # Add useful tools
    && apk-install \
        findutils \
	# Clear apk's cache
	&& apk-cleanup

WORKDIR "/data"

VOLUME ["/data"]
