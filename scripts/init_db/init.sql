CREATE DATABASE IF NOT EXISTS blog;
USE blog;
CREATE TABLE article (
    ID INT PRIMARY KEY,
    Title VARCHAR(255),
    PostText TEXT,
    Date DATE,
    ImageURL VARCHAR(255),
    Tags JSON
);

CREATE TABLE blog_posts (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Posters JSON
);
