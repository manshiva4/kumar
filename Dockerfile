#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
FROM spark:latest

USER root


RUN rm -rf /opt/spark/examples/jars/jackons-mapper-asl-1.9.13.jar
RUN rm -rf /opt/spark/examples/jars/jackson-mapper-asl-1.9.13.jar
RUN rm -rf /usr/share/doc/libtinfo6
RUN rm -rf /usr/share/doc/libncursesw6
RUN rm -rf /usr/share/doc/ncurses-bin
RUN rm -rf /usr/share/doc/libsqlite3-0
RUN rm -rf /usr/share/doc/libpcre2-8-0
RUN rm -rf /usr/share/lintian/overrides/libc-bin
RUN rm -rf /usr/share/lintian/overrides/libc6
RUN rm -rf /opt/spark/jars/hadoop-client-runtime-3.4.0.jar
