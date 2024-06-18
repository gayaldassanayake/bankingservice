import gayaldassanayake/bankingservice.accounts as accounts;

# Returns customer information.
#
# + id - customer id
# + return -  customer information if the id is valid, an error otherwise.
public function retrieveCustomer(string id) returns Customer|error {
    if customerMap.hasKey(id) {
        Customer customer = customerMap.get(id);
        customer.accounts = check accounts:retrieveAccountsOfCustomer(id);
        return customer;
    }
    return error("Customer not found");
}

map <Customer> customerMap = {
    "1" : {
        id: "1",
        name: "John",
        email: "john@example.com",
        accounts: []
    },
    "2" : {
        id: "2",
        name: "Jane",
        email: "jane@example.com",
        accounts: []
    }
};

# Customer information record.
#
# + id - unique customer id
# + name - name of the customer  
# + email - email of the customer  
# + accounts - list of accounts owned by the customer
public type Customer record {|
    string id;
    string name;
    string email;
    accounts:Account[] accounts;
|};
