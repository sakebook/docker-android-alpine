FROM frolvlad/alpine-glibc
MAINTAINER Shinya Sakemoto <sakebook@gmail.com>

RUN apk update && \
  apk upgrade && \
  apk --no-cache add openjdk8 ca-certificates openssl bash git

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV SDK_TOOL_VERSION=tools_r25.2.5-linux
ENV ANDROID_HOME=/usr/local/android-sdk-linux
ENV PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin

# install android sdk
RUN mkdir $ANDROID_HOME && \
  wget "https://dl.google.com/android/repository/${SDK_TOOL_VERSION}.zip" && \
  unzip -d $ANDROID_HOME $SDK_TOOL_VERSION.zip && \
  rm -rf $SDK_TOOL_VERSION.zip

# prepare sdkmanager
RUN mkdir -p $ANDROID_HOME/licenses/ && \
  echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > $ANDROID_HOME/licenses/android-sdk-license && \
  echo "84831b9409646a918e30573bab4c9c91346d8abd" > $ANDROID_HOME/licenses/android-sdk-preview-license && \
  mkdir ~/.android && \
  echo "count=0" > ~/.android/repositories.cfg

# install android tools and more
RUN sdkmanager "tools" "build-tools;25.0.3" "platforms;android-25" "platform-tools" "extras;android;m2repository" && \
sdkmanager --uninstall "patcher;v4" "emulator"
