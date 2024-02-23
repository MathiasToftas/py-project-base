FROM python:3.11.0

ENV VIRTUAL_ENV=/usr/local
ADD --chmod=755 https://astral.sh/uv/install.sh /install.sh
RUN /install.sh && rm /install.sh
ENV PATH /root/.cargo/bin:$PATH
