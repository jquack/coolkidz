export FLASK_APP=$(pwd)/coolkidz.py

if [ "$#" -eq 1 ]
then
	host=$1
else
	host=127.0.0.1
fi
flask run --host=$host
