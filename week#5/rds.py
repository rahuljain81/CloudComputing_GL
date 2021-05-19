#*********************************************************************************************************************
#Author - Nirmallya Mukherjee
#This script will connect to a MySQL DB using multiple driver options
#*********************************************************************************************************************
import mysql.connector

hostname = 'mysql-db-instance.cybspxxck7ko.us-east-1.rds.amazonaws.com'
#hostname = 'localhost'
username = 'admin'
password = 'password'
database = 'employees'

# Simple routine to run a query on a database and print the results:
def doQuery(conn) :
    cur = conn.cursor()
    cur.execute("SELECT emp_no, first_name, last_name, email_id FROM employees limit 10")
    for emp, firstname, lastname, email in cur.fetchall() :
        print emp, firstname, lastname, email

def mysqlConnector() :
    print "\n\nUsing mysql.connector"
    print "---------------------"
    myConnection = mysql.connector.connect(host=hostname, user=username, passwd=password, db=database)
    doQuery(myConnection)
    myConnection.close()


def createOrder() :
    print "\n\nUsing any of the above connectors, insert a new record in the orders table"
    conn = mysql.connector.connect(host=hostname, user=username, passwd=password, db=database)
    cur = conn.cursor()
    # TBD:You have to write this code and submit as part of the lab
    create_order_sql = (
        "insert into orders ("
        "OrderID, OrderUserID, OrderShipName, OrderEmail )"
        "value ('ord00001', 16528, 'Rahul', 'rahuljain81@gmail.com')"
    )
    cur.execute (create_order_sql)
    conn.commit()
    cur.close()
    conn.close()


def main() :
    mysqlConnector()
    createOrder()


main()
