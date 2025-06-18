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
FROM ubuntu:noble as ubn

FROM spark:3.5.3-scala2.12-java17-ubuntu

USER root

COPY --from=ubn / /

RUN rm -rf /opt/spark/examples/jars/jackons-mapper-asl-1.9.13.jar \
    && rm -rf /opt/spark/examples/jars/jackson-mapper-asl-1.9.13.jar \
    && rm -rf /opt/spark/jars/hadoop-client-runtime-3.4.0.jar \
    && rm -rf /opt/spark/jars/avro-ipc-1.12.0.jar \
    && rm -rf /usr/share/doc/ncurses-base \
    && rm -rf /usr/share/doc/ncurses-bin \
    && rm -rf /usr/share/doc/libncursesw6 \
    && rm -rf /usr/share/doc/libtinfo6 \
    && rm -rf /usr/share/doc/libpcre2-8-0 \
    && rm -rf /usr/share/doc/libzstd1 \
    && rm -rf /usr/share/lintian/overrides/libssl3t64
    
