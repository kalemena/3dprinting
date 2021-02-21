FROM python:3.7

# Python SDF
RUN mkdir -p /opt \
    && git clone https://github.com/fogleman/sdf.git \
    && cd sdf \
    && pip install -e .

CMD [ "/bin/bash" ]