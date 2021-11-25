#! /bin/bash
mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static
#cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r templates/* tempdir/static/.
 

#Création du fichier Dockerfile 

rm tempdir/Dockerfile
cp test_app.py tempdir/
echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip3 install flask" >> tempdir/Dockerfile
echo "COPY ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY test_app.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/test_app.py" >> tempdir/Dockerfile

#Lancement du build de l'image testapp à partir de Dockerfile sous /tempdir
 
cd tempdir
docker build -t testapp .

#lancement du container testrunning avec l'image testapp
 
docker run -t -d -p 5050:5050 --name testrunning testapp

#Tester si le container a bien démarré

docker ps -a
