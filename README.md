# docker-android-alpine
Android development environment on Alpine using Docker

## Content
### Android

  Path                        | Version | Description                    | Location
  -------                     | ------- | -------                        | -------
  build-tools;30.0.2          | 30.0.2  | Android SDK Build-Tools 30.0.2 | build-tools/30.0.2/
  extras;android;m2repository | 47.0.0  | Android Support Repository     | extras/android/m2repository/
  platform-tools              | 30.0.5  | Android SDK Platform-Tools     | platform-tools/
  platforms;android-30        | 3       | Android SDK Platform 30        | platforms/android-30/


### Others
- glibc
- Open JDK 8
- CA Certificates
- OpenSSL
- Bash
- Git
- Ruby
- Bundler
- ruby-json
- ruby-dev
- make
- gcc
- libc-dev

## Build
```
$ git clone git@github.com:sakebook/docker-android-alpine.git
$ cd docker-android-alpine
$ docker build -t docker-android-alpine:30.0.2 .
$ docker run -it docker-android-alpine:30.0.2 /bin/sh
```

## Include docker images
[frolvlad/alpine-glibc](https://hub.docker.com/r/frolvlad/alpine-glibc/)

## LICENSE
```
Copyright (C) 2018 Shinya Sakemoto

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
