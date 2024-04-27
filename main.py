from flask import Flask, render_template, session, request, redirect, url_for
from werkzeug.utils import secure_filename
from flask_sqlalchemy import SQLAlchemy
from flask_mysqldb import MySQL
import pymysql
import random
import os
import json

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

    
app = Flask(__name__)
app.secret_key = "secret-key"
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql://root:@localhost/ammarnaswebsitedatabase2024"
db = SQLAlchemy(app)
con = pymysql.connect(host='localhost', user='root', password='', database='ammarnaswebsitedatabase2024')
app.config['UPLOAD_FOLDER'] = params['path']


class Info(db.Model):
    name = db.Column(db.String(60), unique=False, nullable=False, primary_key=True)
    born = db.Column(db.String(90), unique=False, nullable=False, primary_key=False)
    dead = db.Column(db.String(90), unique=False, nullable=True, primary_key=False)
    image = db.Column(db.String(200), unique=False, nullable=False, primary_key=False)

class Village(db.Model):
    title = db.Column(db.String(150), unique=False, nullable=False, primary_key=True)
    image = db.Column(db.String(200), unique=True, nullable=False, primary_key=False)

class Files(db.Model):
    image = db.Column(db.String(200), unique=True, nullable=False, primary_key=True)


@app.route("/", methods=['GET', 'POST'])
def home():
    people = Info.query.filter_by().all()[0:3]
    village = Village.query.filter_by().all()[0:3]
    banner = random.choice(village)
    banner_min = random.choice(people)

    return render_template("index.html", people=people, banner=banner, banner_min=banner_min, village=village)

@app.route("/ammarnas/<string:image>", methods=['GET', 'POST'])
def people(image):
    village = Village.query.filter_by().all()[0:3]
    banner = random.choice(village)
    person = Info.query.filter_by(image=image).first()
    return render_template("people.html", person=person, banner=banner)

@app.route("/ammarnas/village/<string:image>", methods=['GET', 'POST'])
def allVillage(image):
    village = Village.query.filter_by(image=image).first()
    return render_template("village.html", village=village)

@app.route("/people", methods=['GET', 'POST'])
def persons():
    person = Info.query.filter_by().all()
    village = Village.query.filter_by().all()[0:3]
    banner = random.choice(village)
    return render_template("all-people.html", person=person, banner=banner)

@app.route("/village", methods=['GET', 'POST'])
def village():
    village = Village.query.filter_by().all()
    return render_template("village-img.html", village=village)

@app.route("/upload", methods=['GET', 'POST'])
def upload():
    if (request.method=='POST'):
        name = request.form.get("name")
        born = request.form.get("born")
        dead = request.form.get("dead")
        image = request.form.get("img")

        data = Info(name=name, born=born, dead=dead, image=image)
        db.session.add(data)
        db.session.commit()
        return render_template("file.html")
        
    return render_template("upload.html")

@app.route("/upload-village", methods=['GET', 'POST'])
def uploadVillage():
    if (request.method=='POST'):
        title = request.form.get("title")
        image = request.form.get("img")

        data = Village(title=title, image=image)
        db.session.add(data)
        db.session.commit()
        return render_template("file.html")
        
    return render_template("upload-village.html")

@app.route("/image", methods=['GET', 'POST'])
def image():
    if (request.method=='POST'):
        filename = request.files["image"]

        file = Files(image=filename)
        db.session.add(file)
        db.session.commit()
        
        filename.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(filename.filename)))
    return render_template("file.html")

app.run(debug=True)
