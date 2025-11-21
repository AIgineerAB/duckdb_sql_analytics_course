# Exploring Sakila database

## Films in Sakila

```sql films
  select
      title,
      description,
      rating,
      length,
      release_year
  from sakila.film
```

## Top customers

Sorted after how much they have paid in total for rentals

```sql rental
select
  customer,
  SUM(amount) AS total_amount,
  COUNT(*) AS number_of_rentals
from sakila.rental_customer
group by customer_id, customer
order by total_amount desc, number_of_rentals desc
limit 10;
```

<BarChart
    data={rental}
    title="Top customers measured by total amount paid, {inputs.category.label}"
    x=customer
    y=total_amount
    swapXY = true
/>

```sql rent
from sakila.rental_customer;
```

## Analyzing payments

Choose your store

<Dropdown data={rent} name=store value=store_id title="select a store" defaultValue='1'>
</Dropdown>

Need to truncate the day

```sql customer
select
  date_trunc('day',payment_date) as pay_date,
  sum(amount) as total_amount
from sakila.rental_customer
where
  store_id = ${inputs.store.value} and payment_date between '2005-05-01' and '2005-09-01'
group by pay_date
;
```

<LineChart 
    data={customer}
    x=pay_date
    y=total_amount 
    yAxisTitle="Total amount"
    xAxisTitle="Payment date"
    title="Payment over time for store"
/>
