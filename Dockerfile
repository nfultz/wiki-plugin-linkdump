FROM lapax/nodejs-wiki:latest

RUN npm install -g grunt grunt-cli grunt-contrib-coffee grunt-contrib-watch grunt-git-authors

ADD . /linkdump/
WORKDIR /linkdump/
RUN npm install
RUN grunt build
RUN npm link

WORKDIR /usr/local/lib/node_modules/wiki/
RUN npm link wiki-plugin-linkdump

EXPOSE 3000
CMD ["/usr/local/bin/wiki", "-p", "3000"]

