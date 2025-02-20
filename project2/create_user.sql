CREATE USER GUEST01 IDENTIFIED BY passwd;

GRANT CONNECT TO GUEST01;
GRANT SELECT ON DOCUMENT TO GUEST01;
GRANT SELECT ON Notifications TO GUEST01;

COMMIT;


CREATE USER TEACHER01 IDENTIFIED BY passwd;

GRANT CONNECT TO TEACHER01;
GRANT SELECT ON DOCUMENT TO TEACHER01;
GRANT SELECT ON Notifications TO TEACHER01;

COMMIT;


CREATE USER STD001 IDENTIFIED BY passwd;

GRANT CONNECT TO STD001;
GRANT SELECT ON DOCUMENT TO STD001;
GRANT INSERT ON DOCUMENT TO STD001;
GRANT SELECT ON Notifications TO STD001;

COMMIT;


CREATE USER HR_ADMIN IDENTIFIED BY passwd;

GRANT CONNECT TO HR_ADMIN;
GRANT SELECT ON DOCUMENT TO HR_ADMIN;
GRANT SELECT ON Notifications TO HR_ADMIN;


CREATE USER PR_ADMIN IDENTIFIED BY passwd;

GRANT CONNECT TO PR_ADMIN;
GRANT SELECT ON DOCUMENT TO PR_ADMIN;
GRANT SELECT ON Notifications TO PR_ADMIN;
GRANT SELECT ON Book_Inventory TO PR_ADMIN;
GRANT INSERT ON Book_Inventory TO PR_ADMIN;
GRANT ALTER ON Book_Inventory TO PR_ADMIN;
GRANT UPDATE ON Book_Inventory TO PR_ADMIN;

GRANT EXECUTE ON TO_DATA_LABEL TO PR_ADMIN;
GRANT EXECUTE ON TO_DATA_LABEL TO STD001;

COMMIT;