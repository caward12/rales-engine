# Rales Engine
## Description
This project creates an API and endpoints to access records, relationships, and business intelligence for an imaginary e-commerce site. All returned data renders as JSON in the browser.

Technology: Ruby, Rails, PostgresSQL, and RSpec.

## Getting Started

1. Run `git clone git@github.com:caward12/rales-engine.git` using SSH or `git clone https://github.com/caward12/rales-engine.git` using HTTPS.

2. Navigate into the rales-engine directory with `cd rales-engine`

3. Run `bundle` from the command line to install all needed gems.

4. Run `rake db:create db:migrate` to set up the PostgresSQL database.

5. Run `rake import_csv:import_all` to seed the database - this will take a few moments.

6. Run `rails s` to start the server, visit `localhost:3000/api/v1/merchants` on the browser, or run the spec harness while the server is up.

7. Enjoy.

##Endpoints##

all endpoints can be accessed through `/api/v1`

**Merchants**

`/merchants` lists all merchants

`/merchants/:id` displays a single merchant that matches the :id passed in

`/merchants/:id/items` returns collection of items for that merchant

`/merchants/:id/invoices` returns a collection of invoices for that merchant

`/merchants/:id/revenue` returns the total revenue for that merchant across all transactions

`/merchants/:id/revenue?date=x` returns the total revenue for that merchant for a specific invoice date `x`

`/merchants/:id/favorite_customer` returns the customer who has conducted the most total number of successful transactions.

`/merchants/find?parameters` returns a single merchant record that matches the parameters passed in. You can search via name, id, created_at and updated_at

`/merchants/find_all?parameters` returns all merchant records that match the parameters passed in. You can search via name, id, created_at and updated_at

`/merchants/random` returns a random single merchant record

`/merchants/most_revenue?quantity=x` returns the top `x` merchants ranked by total revenue

`/merchants/most_items?quantity=x` returns the top `x` merchants ranked by total number of items sold

`/merchants/revenue?date=x` returns the total revenue for date `x` across all merchants



**Transactions** 

`/transactions` lists all transactions

`/transactions/:id` displays a single transaction that matches the :id passed in

`/transactions/:id/invoice` returns the associated invoice for that transaction

`/transactions/find?parameters` returns a single transaction record that matches the parameters passed in. You can search via id, result, credit_card_number, created_at and updated_at

`/transactions/find_all?parameters` returns all transaction records that match the parameters passed in. You can search via id, result, credit_card_number, created_at and updated_at

`/transactions/random` returns a random single transaction record

**Customers**

`/customers` lists all customers

`/customers/:id` displays a single customer that matches the :id passed in

`/customers/:id/invoices` returns a collection of associated invoices for that customer

`/customers/:id/transactions` returns a collection of associated transactions for that customer

`/customers/:id/favorite_merchant` returns a merchant where the customer has conducted the most successful transactions

`/customers/find?parameters` returns a single customer record that matches the parameters passed in. You can search via id, first_name, last_name, created_at and updated_at

`/customers/find_all?parameters`returns all customer records that match the parameters passed in. You can search via id, first_name, last_name, created_at and updated_at

`/customers/random` returns a random single customer record


**Invoices**

`/invoices` lists all invoices

`/invoices/:id` displays a single invoice that matches the :id passed in

`/invoices/:id/transactions` returns a collection of associated transactions for that invoice

`/invoices/:id/invoice_items` returns a collection of associated invoice items for that invoice

`/invoices/:id/items` returns a collection of associated items for that invoice

`/invoices/:id/customer` returns the associated customer for that invoice

`/invoices/:id/merchant` returns the associated merchant for that invoice

`/invoices/find?parameters` returns a single invoice record that matches the parameters passed in. You can search via id, status, merchant_id, customer_id, created_at and updated_at

`/invoices/find_all?parameters` returns all invoice records that match the parameters passed in. You can search via id, status, merchant_id, customer_id, created_at and updated_at

`/invoices/random` returns a random single invoice record


**Invoice Items**

`/invoice_items` lists all invoice items

`/invoice_items/:id` displays a single invoice item that matches the :id passed in

`/invoice_items/:id/invoice` returns the associated invoice for that invoice_item

`/invoice_items/:id/item` returns the associated item for that invoice_item

`/invoice_items/find?parameters` returns a single invoice item record that matches the parameters passed in. You can search via id, quantity, unit_price, invoice_id, item_id, created_at and updated_at

`/invoice_items/find_all?parameters` returns all invoice item records that match the parameters passed in. You can search via id, quantity, unit_price, invoice_id, item_id, created_at and updated_at

`/invoice_items/random` returns a random single invoice item record


**Items**

`/items` lists all items

`/items/:id` displays a single item that matches the :id passed in

`/items/:id/invoice_items` returns a collection of associated invoice items for that item

`/items/:id/merchant` returns the associated merchant for that item

`/items/:id/best_day` returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, returns the most recent day.

`/items/find?parameters` returns a single item record that matches the parameters passed in. You can search via id, name, description, unit_price, merchant_id, created_at and updated_at

`/items/find_all?parameters` returns all item records that match the parameters passed in. You can search via id, name, description, unit_price, merchant_id, created_at and updated_at

`/items/random` returns a random single item record

`/items/most_revenue?quantity=x` returns the top `x` items ranked by total revenue generated

`/items/most_items?quantity=x` returns the top `x` item instances ranked by total number sold
