FROM frolvlad/alpine-glibc:alpine-3.13
LABEL Shinya Sakemoto <sakebook@gmail.com>

RUN apk update && \
  apk upgrade && \
  apk --no-cache add \
    openjdk8 \
    ca-certificates \
    openssl \
    bash \
    git \
    ruby \
    ruby-bundler \
    ruby-json \
    ruby-dev \
    make \
    gcc \
    libc-dev \
    wget

ENV ANDROID_SDK_ROOT=/usr/local/sdk
ENV CLI_TOOL_VERSION=commandlinetools-linux-6858069_latest
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH=$PATH:$ANDROID_SDK_ROOT:$ANDROID_SDK_ROOT/cmdline-tools/tools/bin

# install android sdk
RUN mkdir -p $ANDROID_SDK_ROOT/cmdline-tools && \
  wget "https://dl.google.com/android/repository/${CLI_TOOL_VERSION}.zip" && \
  unzip -d $ANDROID_SDK_ROOT/cmdline-tools $CLI_TOOL_VERSION.zip && \
  rm -rf $CLI_TOOL_VERSION.zip && \
  mv $ANDROID_SDK_ROOT/cmdline-tools/cmdline-tools $ANDROID_SDK_ROOT/cmdline-tools/tools

# prepare sdkmanager
RUN yes | sdkmanager --licenses

# install android tools and more
RUN sdkmanager "tools" "build-tools;30.0.2" "platforms;android-30" "platform-tools" "extras;android;m2repository" && \
sdkmanager --uninstall "patcher;v4" "emulator"