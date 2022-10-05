FROM node:10
COPY . .
RUN npm install
RUN npm build
CMD ["npm", "start"]
