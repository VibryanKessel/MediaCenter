-Utiliser Tomcat 10 pour le projet

-Une fois le projet importé, importer la base de données à l'aide du fichier ./mediacenter.sql

-Bien vous assurer de remplacer 8001 parle port de mysql dans les différentes classes requests du projet

Les différentes requetes :

/*---------------------------USERS------------------------*/

GET  /users                       ---------->  get all users
GET /users/{pseudo}               ---------->  get a User with its pseudo
POST /users/add with a JSON body  ---------->  insert user

/*---------------------------MEDIAS------------------------*/

GET /medias       --------> get all medias
GET /medias/{id}  -------->  get media with its id
GET /medias/category/{categoryName}  -------->   get media by category 
GET /medias/city/{cityName}  -------->   get media by city 
GET /medias/key/{keyword}  -------->   get media by keyword(applied on the title)
POST /medias/add with a media in body  -----------> insert media
POST /medias/delete with a media id in body   -------->   delete media

/*---------------------------BORROWS------------------------*/

GET /borrows/borrower/{pseudo}  ----------->  get a user's borrows
GET /borrows/owner/{pseudo}   ------------->  get a user's loaned medias 
POST /borrows/add with a borrow in body  --------> insert a borrow

/*---------------------------RECOMMENDATIONS------------------------*/

GET /recommendations/recommender/{pseudo} ----------->  get Recommendations of a user
GET /recommendations/media/{id}   ------------->  get list of users who recommended a media 
POST /recommendations/add with a recommendations in body  --------> insert recommendation


