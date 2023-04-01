1. clone this repository
2. open it and run docker build -t local_mail:v1 .
3. docker run -it --name mailer -p 8000:8000 -p 2525:2525 mailer:v1 sh
4. bin/mailocal