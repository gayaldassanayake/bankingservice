# Returns the list of accounts belonging to a customer.
#
# + customerId - customer id
# + return -  account information if the customer id is valid, an error otherwise.
public function retrieveAccountsOfCustomer(string customerId) returns Account[]|error {
    if accountMap.hasKey(customerId) {
        return accountMap.get(customerId);
    }
    return error("Customer not found");
}

map <Account[]> accountMap = {
    "1" : [
        {
            id: "1",
            'type: "Savings",
            currency: "INR",
            balance: 1000.90
        },
        {
            id: "2",
            'type: "Current",
            currency: "USD",
            balance: 500.20
        }
    ],
    "2" : [
        {
            id: "3",
            'type: "Current",
            currency: "LKR",
            balance: 2000.00
        },
        {
            id: "4",
            'type: "Fixed Deposit",
            currency: "USD",
            balance: 1000.00
        }
    ]
};

# Account information record.
#
# + id - id of the account description  
# + 'type - account type
# + currency - account currency
# + balance - account balance
public type Account record {|
    string id;
    string 'type;
    string currency;
    float balance;
|};
