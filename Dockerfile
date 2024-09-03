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
FROM spark4.0.0-java22-scala-2404ubuntu-curl

USER root

RUN set -ex; \
    apt-get update; \
    apt install -y build-essential zlib1g-dev libffi-dev; \
    ##zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev  wget libbz2-dev; \
    wget https://www.python.org/ftp/python/3.9.18/Python-3.9.18.tgz;\
    tar -xf Python-3.9.18.tgz;\
    cd Python-3.9.18;\
    ./configure --enable-optimization;\
    make -j 8;\
    make altinstall;\
    rm -rf /var/lib/apt/lists/*;

##set default version to 3.7
Run set -ex;\
    ln -s -f /usr/local/bin/pip3.9 /usr/local/bin/pip;\
    ln -s -f /usr/local/bin/pip3.9 /usr/local/bin/pip3;\
    ln -s -f /usr/local/bin/python3.9 /usr/local/bin/python3;\
    ln -s -f /usr/local/bin/python3.9 /usr/local/bin/python;

##fix sensitive data vulnerabilities
Run set -ex;\
    rm -rf /usr/local/lib/python3.9/test;\
    rm -rf /opt/spark/work-dir/Python-3.9.18/Lib/test;

COPY entrypoint.sh /op/

ENV SPARK_HOME /opt/spark

WORKDIR /opt/spark/work-dir    

USER spark

ENTRYPOINT [ "/opt/entrypoint.sh" ]
