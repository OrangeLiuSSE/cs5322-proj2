--wiki
INSERT INTO LBAC_ADMIN.Document (title, author, publication_year, type_id, owner_id, department_id, DOC_OLS_COL)
VALUES ('ML Basics Wiki', 'Library Staff', 2021, 1, NULL, 1000, TO_DATA_LABEL('doc_ols','WK'));

INSERT INTO Document (title, author, publication_year, type_id, owner_id, department_id, DOC_OLS_COL)
VALUES ('Introduction to Big Data Wiki', 'Library Staff', 2022, 1, NULL, 2000, TO_DATA_LABEL('doc_ols','WK'));

-- book
INSERT INTO Document (title, author, publication_year, type_id, owner_id, department_id, DOC_OLS_COL)
VALUES ('Data Structures and Algorithms', 'Mark Green', 2018, 2, 101, 2100, TO_DATA_LABEL('doc_ols','CONF:BK'));

INSERT INTO Document (title, author, publication_year, type_id, owner_id, department_id, DOC_OLS_COL)
VALUES ('Artificial Intelligence: A Modern Approach', 'Stuart Russell', 2020, 2, 102, 2200,TO_DATA_LABEL('doc_ols','CONF:BK'));

-- testpaper
INSERT INTO LBAC_ADMIN.Document (title, author, publication_year, type_id, owner_id, department_id, DOC_OLS_COL)
VALUES ('Final Exam - Data Science', 'Prof. Evans', 2023, 3, 201, 2300, TO_DATA_LABEL('doc_ols','S:TP:SOC_IS'));

INSERT INTO Document (title, author, publication_year, type_id, owner_id, department_id, DOC_OLS_COL)
VALUES ('Midterm Exam - Machine Learning', 'Prof. Brown', 2022, 3, 202, 2400, TO_DATA_LABEL('doc_ols','S:TP:SOC_AI'));

-- slides
INSERT INTO Document (title, author, publication_year, type_id, owner_id, department_id, DOC_OLS_COL)
VALUES ('Intro to SQL Slides', 'Dr. Carter', 2021, 4, 301, 2200, TO_DATA_LABEL('doc_ols','S:SL:SOC_CS'));

INSERT INTO Document (title, author, publication_year, type_id, owner_id, department_id, DOC_OLS_COL)
VALUES ('Deep Learning Workshop Slides', 'Dr. Thompson', 2023, 4, 302, 3000, TO_DATA_LABEL('doc_ols','S:SL:ENG'));

-- managementdoc
INSERT INTO Document (title, author, publication_year, type_id, owner_id, department_id, DOC_OLS_COL)
VALUES ('Library Rules and Regulations', 'Library Admin', 2022, 5, NULL, 4000, TO_DATA_LABEL('doc_ols','TS:MD:SC'));

INSERT INTO Document (title, author, publication_year, type_id, owner_id, department_id, DOC_OLS_COL)
VALUES ('Data Privacy Policy', 'Compliance Team', 2021, 5, NULL, 5000, TO_DATA_LABEL('doc_ols','TS:MD:SC'));

COMMIT;
ROLLBACK;

SELECT * FROM lbac_admin.Document;

DELETE FROM DOCUMENT;


INSERT INTO Notifications (content, classification, created_at, notif_ols_col) VALUES ('System maintenance scheduled for midnight.', 'CONF', SYSDATE - 10, TO_DATA_LABEL('notif_ols','CONF'));
INSERT INTO Notifications (content, classification, created_at, notif_ols_col) VALUES ('New security policy update available.', 'SECERT', SYSDATE - 9, TO_DATA_LABEL('notif_ols','S'));
INSERT INTO Notifications (content, classification, created_at, notif_ols_col) VALUES ('Management team meeting set for Monday.', 'TS_MG', SYSDATE - 8, TO_DATA_LABEL('notif_ols','TS::MG'));
INSERT INTO Notifications (content, classification, created_at, notif_ols_col) VALUES ('HR policies updated for Q4.', 'TS_HR', SYSDATE - 7, TO_DATA_LABEL('notif_ols','TS::HR'));
INSERT INTO Notifications (content, classification, created_at, notif_ols_col) VALUES ('Performance review deadline approaching.', 'TS_PR', SYSDATE - 6, TO_DATA_LABEL('notif_ols','TS::PR'));
INSERT INTO Notifications (content, classification, created_at, notif_ols_col) VALUES ('Security audit scheduled for next week.', 'TS_SEC', SYSDATE - 5, TO_DATA_LABEL('notif_ols','TS::SEC'));
INSERT INTO Notifications (content, classification, created_at, notif_ols_col) VALUES ('Financial report for Q3 is now available.', 'TS_FIN', SYSDATE - 4, TO_DATA_LABEL('notif_ols','TS::FIN'));
INSERT INTO Notifications (content, classification, created_at, notif_ols_col) VALUES ('Upcoming holiday schedule announced.', 'CONF', SYSDATE - 3, TO_DATA_LABEL('notif_ols','CONF'));
INSERT INTO Notifications (content, classification, created_at, notif_ols_col) VALUES ('Confidential data handling guidelines updated.', 'SECERT', SYSDATE - 2, TO_DATA_LABEL('notif_ols','S'));
INSERT INTO Notifications (content, classification, created_at, notif_ols_col) VALUES ('New security measures implemented company-wide.', 'TS_SEC', SYSDATE - 1, TO_DATA_LABEL('notif_ols','TS::SEC'));

COMMIT;

SELECT * FROM lbac_admin.Notifications;



-- Insert 10 rows of sample data
INSERT INTO lbac_admin.Book_Inventory (document_id, total_quantity, available_quantity, damaged_quantity, invent_read_ols_col, invent_insert_ols_col) VALUES (101, 10, 8, 2, TO_DATA_LABEL('invent_read_ols','CONF'), TO_DATA_LABEL('invent_insert_ols','S'));
INSERT INTO lbac_admin.Book_Inventory (document_id, total_quantity, available_quantity, damaged_quantity, invent_read_ols_col, invent_insert_ols_col) VALUES (102, 15, 12, 3, TO_DATA_LABEL('invent_read_ols','CONF'), TO_DATA_LABEL('invent_insert_ols','S'));
INSERT INTO lbac_admin.Book_Inventory (document_id, total_quantity, available_quantity, damaged_quantity, invent_read_ols_col, invent_insert_ols_col) VALUES (103, 20, 18, 2, TO_DATA_LABEL('invent_read_ols','CONF'), TO_DATA_LABEL('invent_insert_ols','S'));
INSERT INTO lbac_admin.Book_Inventory (document_id, total_quantity, available_quantity, damaged_quantity, invent_read_ols_col, invent_insert_ols_col) VALUES (104, 25, 20, 5, TO_DATA_LABEL('invent_read_ols','CONF'), TO_DATA_LABEL('invent_insert_ols','S'));
INSERT INTO lbac_admin.Book_Inventory (document_id, total_quantity, available_quantity, damaged_quantity, invent_read_ols_col, invent_insert_ols_col) VALUES (105, 12, 11, 1, TO_DATA_LABEL('invent_read_ols','CONF'), TO_DATA_LABEL('invent_insert_ols','S'));
INSERT INTO lbac_admin.Book_Inventory (document_id, total_quantity, available_quantity, damaged_quantity, invent_read_ols_col, invent_insert_ols_col) VALUES (106, 30, 28, 2, TO_DATA_LABEL('invent_read_ols','CONF'), TO_DATA_LABEL('invent_insert_ols','S'));
INSERT INTO lbac_admin.Book_Inventory (document_id, total_quantity, available_quantity, damaged_quantity, invent_read_ols_col, invent_insert_ols_col) VALUES (107, 18, 15, 3, TO_DATA_LABEL('invent_read_ols','CONF'), TO_DATA_LABEL('invent_insert_ols','S'));
INSERT INTO lbac_admin.Book_Inventory (document_id, total_quantity, available_quantity, damaged_quantity, invent_read_ols_col, invent_insert_ols_col) VALUES (108, 22, 20, 2, TO_DATA_LABEL('invent_read_ols','CONF'), TO_DATA_LABEL('invent_insert_ols','S'));
INSERT INTO lbac_admin.Book_Inventory (document_id, total_quantity, available_quantity, damaged_quantity, invent_read_ols_col, invent_insert_ols_col) VALUES (109, 16, 14, 2, TO_DATA_LABEL('invent_read_ols','CONF'), TO_DATA_LABEL('invent_insert_ols','S'));
INSERT INTO lbac_admin.Book_Inventory (document_id, total_quantity, available_quantity, damaged_quantity, invent_read_ols_col, invent_insert_ols_col) VALUES (110, 28, 25, 3, TO_DATA_LABEL('invent_read_ols','CONF'), TO_DATA_LABEL('invent_insert_ols','S'));

-- Commit the transaction to save changes
COMMIT;

DELETE FROM lbac_admin.Book_Inventory;
SELECT * FROM lbac_admin.Book_Inventory;


