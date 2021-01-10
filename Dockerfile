FROM python:latest

# upgrade pip pkgs to latest at build time
RUN pip3 -q install pip --upgrade

# Create /src directory for any external code and data
RUN mkdir notebooks notebooks/src 
WORKDIR notebooks/src/
COPY . .

# install jupyter notebooks
RUN pip3 install notebook

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-armhf /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root","--notebook-dir=/notebooks"]
