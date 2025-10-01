FROM  python:3.13.7

WORKDIR /code 
#working directory, this is the starting directory in the container, so like local folder on the machine will be mapped to this inside the container
COPY  ./requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt
#--no-cache-dir --> docker has its own cache so that is why it is not necessary

COPY ./src ./src
#copy the source directory

CMD [ "uvicorn","src.main:app","--host","0.0.0.0","--port","80","--reload" ]
#specifying the entry command



#docker built -t fastapi-image . --> this is how you built the image