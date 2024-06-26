import gayaldassanayake/bankingservice.customers as customers;

import ballerina/http;

# A service that provides banking services
service /abc\-bank on new http:Listener(9090) {

    # A resource for logging in to the system
    # + username - name as a string
    # + password - password as a string
    # + return - successful login message or error
    resource function post login(string username, string password) returns string|error {
        if username.length() < 6 {
            return error("Username should be at least 6 characters long");
        }
        if password.length() < 8 {
            return error("Password should be at least 8 characters long");
        }
        return "Login successfull";
    }

    # A resource for getting customer details
    # + id - id of the customer as a string
    # + return - customer details or error
    resource function get customers/[string id]() returns customers:Customer|error {
        return customers:retrieveCustomer(id);
    }
}
