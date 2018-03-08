FROM bestwu/wine:i386

ENV TZ=Asia/Shanghai

RUN apt-get update \
    && apt-get install -y software-properties-common python-software-properties \
    && apt-get update \
    && apt-get install -y tzdata ca-certificates httpie git aptitude libnss3 libnss3:i386 \
    && aptitude search wine \
    && apt-get auto-clean \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && cd / \
    && mkdir wxdt \
    && cd wxdt \
    && git clone https://github.com/cytle/wechat_web_devtools.git \
    && cd wechat_web_devtools \
    && /wxdt/wechat_web_devtools/bin/update_package_nw.sh \
    && /wxdt/wechat_web_devtools/bin/update_nwjs.sh

WORKDIR /wxdt/wechat_web_devtools
