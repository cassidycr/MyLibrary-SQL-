# MyLibrary-SQL-
A mock library management system using SQL. 

My Library is a mock library managment system using SQL. The tables include books, members, borrow, and history. The 'books' table holds data about each book in the library: book_id (PK), ISBN, title, author_last_name, author_first_name, summary, publish year, audience, and category. The 'member' table holds data about library patrons: member_id (PK), member_firt_name, member_last_name, and email_address. The 'borrow' table holds data about the current checked out books: member_id, book_id, borrow_date, and due_date. The 'history' table hold data about the borrow history: member_id, book_id, borrow_date, return_date

The following questions will be answered:
  What are the current borrowed books by patron Megan Fox?
  What is the borrowing history on the book 'A Court Of Thorns And Roses'
  What books by the author, Cassandra Clare, does the library carry?
  What young adult (12-18) books does the library carry?
