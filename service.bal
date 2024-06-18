import gayaldassanayake/bankingservice.customers as customers;

import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service /abc\-bank on new http:Listener(9090) {

    # A resource for generating greetings
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

    resource function get customers/[string id]() returns customers:Customer|error {
        return customers:retrieveCustomer(id);
    }
}
