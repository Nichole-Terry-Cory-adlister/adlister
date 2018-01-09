USE adlister_db;


INSERT INTO users (username,email,password) VALUES
  ("cory","cory@cory.com","$2a$12$6KF5hdOmpmJDX4GSKsx6QuI6CZjVknsJCrhQgaR.oju2X.KaxeDCC"),
  ("terry","terry@terry.com","$2a$12$6KF5hdOmpmJDX4GSKsx6QuI6CZjVknsJCrhQgaR.oju2X.KaxeDCC"),
  ("nichole","nichole@nichole.com","$2a$12$6KF5hdOmpmJDX4GSKsx6QuI6CZjVknsJCrhQgaR.oju2X.KaxeDCC"),
  ("user1","user1@user1.com","$2a$12$6KF5hdOmpmJDX4GSKsx6QuI6CZjVknsJCrhQgaR.oju2X.KaxeDCC"),
  ("user2","user2@user2.com","$2a$12$6KF5hdOmpmJDX4GSKsx6QuI6CZjVknsJCrhQgaR.oju2X.KaxeDCC");

INSERT INTO categories (name) VALUES ("Jobs"),("For Sale"),("Services"),("Housing"),("For Free"),("Misc");
