FROM frolvlad/alpine-glibc
MAINTAINER Shinya Sakemoto <sakebook@gmail.come>

RUN apk update
RUN apk upgrade

# install java
RUN apk --no-cache add openjdk8
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

# for wget
RUN apk --no-cache add ca-certificates
RUN update-ca-certificates
RUN apk --no-cache add openssl

# for sdk tool
RUN apk add --no-cache bash
ENV SDK_TOOL_VERSION=tools_r25.2.5-linux
ENV ANDROID_SDK=android-sdk-linux
ENV PATH=$PATH:/$ANDROID_SDK/tools
ENV PATH=$PATH:/$ANDROID_SDK/tools/bin
ENV ANDROID_HOME=/$ANDROID_SDK

RUN mkdir $ANDROID_SDK
RUN wget -P $ANDROID_SDK "https://dl.google.com/android/repository/${SDK_TOOL_VERSION}.zip"
RUN cd $ANDROID_SDK && unzip $SDK_TOOL_VERSION.zip
RUN rm -rf $ANDROID_SDK/$SDK_TOOL_VERSION.zip

# update android tools
RUN mkdir -p $ANDROID_HOME/licenses/
RUN	echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > $ANDROID_HOME/licenses/android-sdk-license
RUN	echo "84831b9409646a918e30573bab4c9c91346d8abd" > $ANDROID_HOME/licenses/android-sdk-preview-license

RUN sdkmanager "build-tools;25.0.3"
RUN sdkmanager "platforms;android-25"
RUN sdkmanager "platform-tools"
RUN sdkmanager "extras;android;m2repository"
RUN sdkmanager --update

# fetch source
RUN apk --no-cache add git
